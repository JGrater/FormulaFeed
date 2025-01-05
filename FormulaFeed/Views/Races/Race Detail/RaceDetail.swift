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
                RaceInfoBox(race: race)
                    .padding(.bottom, 5)
                
                DriverOfTheDay(driver: Driver(name: "Max Verstappen",
                    team: Team(name: "Redbull Racing", country: "Austrian"),
                    nationality: "Dutch", number: 1))
                
                OfficialHighlights(
                    videoID: "yPvoKz6tyJs",
                    thumbnailURL: "https://img.youtube.com/vi/yPvoKz6tyJs/maxresdefault.jpg"
                )
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
    RaceDetail(race: Race(name: "British Grand Prix", date: "Sun 7th July, 15:00", circuit: "Silverstone Circuit", flag: Image("britain"), countryColour: Color(red: 207 / 255, green: 16 / 255, blue: 41 / 255), countryAccentColour: Color(red: 230 / 255, green: 140 / 255, blue: 150 / 255)))
}
