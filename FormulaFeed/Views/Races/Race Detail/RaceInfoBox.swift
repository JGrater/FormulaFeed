//
//  RaceInfoBox.swift
//  FormulaFeed
//
//  Created by Jason Grater on 03/01/2025.
//

import SwiftUI

struct RaceInfoBox: View {
    let race: Race
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .top) {
                    Image(systemName: "calendar")
                        .frame(width: 20, alignment: .center)
                    Text(race.date)
                        .padding(.leading, 5)
                }
                .padding(.bottom, 10)
                .padding(.top, 5)
                
                HStack(alignment: .top) {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 20, alignment: .center)
                    Text(race.circuit)
                        .padding(.leading, 5)
                }
                .padding(.bottom, 10)
                
                HStack(alignment: .top) {
                    Image(systemName: "tv")
                        .frame(width: 20, alignment: .center)
                    Text("Sky Sports / Channel 4")
                        .padding(.leading, 5)
                }
                .padding(.bottom, 5)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
            )
            .padding(.horizontal)
        }
    }
}

#Preview {
    RaceInfoBox(race: Race(name: "British Grand Prix", date: "Sun 7th July, 15:00", circuit: "Silverstone Circuit", flag: Image("britain"), countryColour: Color(red: 207 / 255, green: 16 / 255, blue: 41 / 255), countryAccentColour: Color(red: 230 / 255, green: 140 / 255, blue: 150 / 255)))
}
