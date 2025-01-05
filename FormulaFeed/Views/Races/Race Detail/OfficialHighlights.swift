//
//  OfficialHighlights.swift
//  FormulaFeed
//
//  Created by Jason Grater on 04/01/2025.
//

import SwiftUI
import WebKit

struct OfficialHighlights: View {
    let videoID: String
    let thumbnailURL: String
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: thumbnailURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 200)
            } placeholder: {
                ProgressView()
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 5)
            
            VStack(alignment: .leading) {
                Text("Official Highlights")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(Color.white)
                Text("YouTube")
                    .font(.caption2)
                    .bold()
                    .foregroundStyle(Color.white)
            }
            .offset(x: -125, y: -80)
            
            Image(systemName: "play.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundStyle(Color.white)
                .shadow(radius: 10)
        }
        .onTapGesture {
            openYoutube(videoID: videoID)
        }
        .padding()
    }
    
    private func openYoutube(videoID: String) {
        let url = URL(string: "https://www.youtube.com/watch?v=\(videoID)")!
        UIApplication.shared.open(url)
    }
    
    
}

#Preview {
    OfficialHighlights(
        videoID: "xc_jtJF8iuo",
        thumbnailURL: "https://img.youtube.com/vi/xc_jtJF8iuo/maxresdefault.jpg"
    )
}
