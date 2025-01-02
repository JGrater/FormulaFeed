//
//  RacesCarousel.swift
//  FormulaFeed
//
//  Created by Jason Grater on 02/01/2025.
//

import SwiftUI

struct RacesCarousel: View {
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    let races: [Race]
    
    var body: some View {
        ZStack {
            ForEach(0..<races.count, id: \.self) { index in
                RacesCard(race: races[index])
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
                            currentIndex = min(races.count - 1, currentIndex + 1)
                        }
                    }
                })
            )
        }
    }

#Preview {
    let previewRaces: [Race] = [
        Race(name: "British Grand Prix", date: "Sun 7th July, 15:00", circuit: "Silverstone Circuit", flag: Image("britain"), countryColour: Color(red: 207 / 255, green: 16 / 255, blue: 41 / 255), countryAccentColour: Color(red: 230 / 255, green: 140 / 255, blue: 150 / 255))
    ]
    
    RacesCarousel(races: previewRaces)
}
