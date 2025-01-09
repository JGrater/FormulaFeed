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
        Race(
            name: "British Grand Prix",
            date: "Sun 7th July, 15:00",
            circuit: Circuit(
                name: "Silverstone Circuit",
                map: Image("silverstone"),
                country: "United Kingdom",
                countryFlag: Image("britain"),
                location: ""
            ),
            colour: Color(red: 9 / 255, green: 32 / 255, blue: 96 / 255),
            accentColour: Color(red: 130 / 255, green: 30 / 255, blue: 55 / 255).opacity(0.5)
        )
    ]
    
    RacesCarousel(races: previewRaces)
}
