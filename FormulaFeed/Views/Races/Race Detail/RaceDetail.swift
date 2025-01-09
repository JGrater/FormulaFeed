//
//  RaceDetail.swift
//  FormulaFeed
//
//  Created by Jason Grater on 03/01/2025.
//

import SwiftUI

struct RaceDetail: View {
    let race: Race
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                OfficialHighlights(
                    videoID: "yPvoKz6tyJs",
                    thumbnailURL: "https://img.youtube.com/vi/yPvoKz6tyJs/maxresdefault.jpg"
                )
                .padding(.bottom, 5)
                
                RaceInfoBox(race: race)
                    .padding(.bottom, 5)

                DriverOfTheDay(driver: Driver(
                    name: "Max Verstappen",
                    team: Team(name: "Redbull Racing", country: "Austrian"),
                    nationality: "Dutch",
                    number: 1
                ))
                .padding(.bottom, 5)

                FastestLap(driver: Driver(
                    name: "Max Verstappen",
                    team: Team(name: "Redbull Racing", country: "Austrian"),
                    nationality: "Dutch",
                    number: 1
                ))
                .padding(.bottom, 5)
                
                FastestPitstop(driver: Driver(
                    name: "Max Verstappen",
                    team: Team(name: "Redbull Racing", country: "Austrian"),
                    nationality: "Dutch",
                    number: 1
                ))
                .padding(.bottom, 5)
                
                RaceCircuit(circuit: race.circuit)
                
            }
            .background(Color(white: 0.95))
            .navigationTitle(race.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("share", systemImage: "square.and.arrow.up") {
                    
                }
                .buttonStyle(.plain)
                Button("favourite", systemImage: "star") {
                    
                }
                .buttonStyle(.plain)
            }
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
