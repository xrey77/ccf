//
//  YoutubeVideo.swift
//  CCF
//
//  Created by Reynald Marquez-Gragasin on 3/23/25.
//

import SwiftUI
import WebKit

struct YoutubeVideo: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) ->WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}


