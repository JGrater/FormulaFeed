//
//  RacesHome.swift
//  FormulaFeed
//
//  Created by Jason Grater on 17/12/2024.
//

import SwiftUI

struct RacesHome: View {
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    private let images: [String] = ["red", "orange", "blue", "green", "purple"]
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    ForEach(0..<images.count, id: \.self) { index in
                        
                        RacesCard()
                            .opacity(currentIndex == index ? 1.0 : 0.5)
                            .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                            .offset(x: CGFloat(index - currentIndex) * 300 + dragOffset, y: 0)
                
                    }
                }
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            let threshold: CGFloat = 50
                            if value.translation.width > threshold {
                                withAnimation {
                                    currentIndex = max(0, currentIndex - 1)
                                }
                            } else if value.translation.width < -threshold {
                                withAnimation {
                                    currentIndex = min(images.count - 1, currentIndex + 1)
                                }
                            }
                        })
                )
            }
            .navigationTitle("Races")
            .toolbar {
                Button {
                    
                } label: {
                    Label("Search", systemImage: "magnifyingglass")
                }
            }
        }
    }
}

#Preview {
    RacesHome()
}
