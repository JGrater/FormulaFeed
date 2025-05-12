//
//  RaceDetailInfo.swift
//  FormulaFeed
//
//  Created by Jason Grater on 28/01/2025.
//

import SwiftUI

struct RaceDetailInfo: View {
    var body: some View {
        OfficialHighlights(
            videoID: "yPvoKz6tyJs",
            thumbnailURL: "https://img.youtube.com/vi/yPvoKz6tyJs/maxresdefault.jpg"
        )
        .padding(.top, 5)
        .padding(.vertical, 5)
        
        RaceInfoBox(race: Race(
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
        
        RaceCircuit(circuit: Circuit(
            name: "Silverstone Circuit",
            map: Image("silverstone"),
            country: "United Kingdom",
            countryFlag: Image("britain"),
            location: "Northamptonshire"
        ))
    }
}

#Preview {
    RaceDetailInfo()
}
