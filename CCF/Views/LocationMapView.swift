//
//  LocationMapView.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/19/25.
//
import MapKit
import SwiftUI

struct LocationMapView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear(perform: {
                viewModel.checkIfLocationServicesIsEnabled()
            })
    }
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    @Published  var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 14.62760, longitude: 121.13033),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self
        } else {
            print("Show an alert letting them know this is off to go turn it on.")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        switch locationManager.authorizationStatus {
        
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission. Go into Settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}

