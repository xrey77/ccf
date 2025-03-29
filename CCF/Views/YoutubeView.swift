//
//  YoutubeView.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/23/25.
//

import SwiftUI
import AVKit

struct YoutubeView: View {
///    @State private var player = AVPlayer()
    
    var body: some View {
        ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        YoutubeVideo(videoID: "ymVUYsEKKPE")
        }.ignoresSafeArea()
    }
    
    
    
}

struct YoutubeView_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeView()
    }
}

/**
 
 VideoPlayer(player: player)
           .edgesIgnoringSafeArea(.all)
           .onAppear {
               let url = URL(string: "https://www.youtube.com/embed/ymVUYsEKKPE")!
               
               player = AVPlayer(url: url)
               player.play()
               
           }
           .onDisappear {
               player.pause()
           }

 */

