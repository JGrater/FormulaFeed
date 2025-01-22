//
//  RacesCarousel.swift
//  FormulaFeed
//
//  Created by Jason Grater on 02/01/2025.
//

import SwiftUI

struct RacesCarousel: View {
    let races: [Race]
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(0..<races.count, id: \.self) { index in
                        NavigationLink(destination:
                            RaceDetail(race: races[index])
                                .navigationBarBackButtonHidden()
                        ) {
                            RacesCard(race: races[index])
                        }
                        .containerRelativeFrame(.horizontal,
                                                count: verticalSizeClass == .regular ? 1 : 4,
                                                spacing: 0
                        )
                        .scrollTransition(.animated, axis: .horizontal) { content, phase in
                            content
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.6)
                                .opacity(phase.isIdentity ? 1.0 : 0.4)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(60, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
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
        ),
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
        ),
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
