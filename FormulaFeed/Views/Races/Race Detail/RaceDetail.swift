//
//  RaceDetail.swift
//  FormulaFeed
//
//  Created by Jason Grater on 03/01/2025.
//

import SwiftUI

struct RaceDetail: View {
    let race: Race
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            RaceDetailHeader(scrollOffset: $scrollOffset)
            
            ScrollView(showsIndicators: false) {
                OfficialHighlights(
                    videoID: "yPvoKz6tyJs",
                    thumbnailURL: "https://img.youtube.com/vi/yPvoKz6tyJs/maxresdefault.jpg"
                )
                .padding(.vertical, 5)
                    
                RaceInfoBox(race: race)
                    .padding(.bottom, 5)
                    
                DriverOfTheDay(driver: Driver(
                    name: "Max Verstappen",
                    team: Team(name: "Redbull Racing", country: "Austrian", logo: Image("redbull")),
                    nationality: "Dutch",
                    number: 1,
                    photo: Image("verstappen")
                ))
                .padding(.bottom, 5)
                    
                FastestLap(driver: Driver(
                    name: "Max Verstappen",
                    team: Team(name: "Redbull Racing", country: "Austrian", logo: Image("redbull")),
                    nationality: "Dutch",
                    number: 1,
                    photo: Image("verstappen")
                ))
                .padding(.bottom, 5)
                    
                FastestPitstop(driver: Driver(
                    name: "Max Verstappen",
                    team: Team(name: "Redbull Racing", country: "Austrian", logo: Image("redbull")),
                    nationality: "Dutch",
                    number: 1,
                    photo: Image("verstappen")
                ))
                .padding(.bottom, 5)
                    
                RaceCircuit(circuit: race.circuit)
            }
            .coordinateSpace(name: "scroll")
            .onScrollGeometryChange(for: CGFloat.self, of: { geometry in
                return geometry.contentOffset.y
            }, action: { old, new in
                print(new)
                withAnimation(.spring(response: 0.6, dampingFraction: 1, blendDuration: 0)) {
                    if (new >= 0) {
                        scrollOffset = new
                    }
                }
            })
            .safeAreaPadding(.bottom, 10)
        }
    }
}

#Preview {
    RaceDetail(race: Race(
        name: "British Grand Prix",
        date: "Sun 7th July, 15:00",
        circuit: Circuit(
            name: "Silverstone Circuit",
            map: Image("silverstone"),
            country: "United Kingdom",
            countryFlag: Image("britain"),
            location: "Northamptonshire"
        ),
        colour: Color(red: 9 / 255, green: 32 / 255, blue: 96 / 255),
        accentColour: Color(red: 130 / 255, green: 30 / 255, blue: 55 / 255).opacity(0.5)
    ))
}
