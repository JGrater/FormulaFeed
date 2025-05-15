//
//  RacesCard.swift
//  FormulaFeed
//
//  Created by Jason Grater on 17/12/2024.
//

import SwiftUI

struct RacesCard: View {
    let race: Race
    let driverResults: [DriverResult]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 24) {
                FlagImage(image: race.circuit.countryFlag)
                    .frame(width: 80, height: 30)
                    
                VStack(alignment: .leading, spacing: 0) {
                    Text(race.name)
                        .font(.headline)
                        .bold()
                    Text(race.circuit.name)
                        .font(.caption)
                    Text(race.date)
                        .font(.caption)
                        .padding(.top, 5)
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .foregroundStyle(.white)
            }
            .padding(12)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 128, alignment: .leading)
            .background(race.colour)
            .clipShape(.rect(topLeadingRadius: 25, topTrailingRadius: 25, style: .circular))
            
            HStack(alignment: .center) {
                Text("Pos")
                    .frame(width: 30, alignment: .center)
                Text("Driver")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Lap Time")
                    .frame(width: 80, alignment: .trailing)
            }
            .padding()
            .foregroundStyle(.black)
            .font(.subheadline)
            .shadow(radius: 5)
                    
            
            ScrollView(.vertical) {
            
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(driverResults) { result in
                        DriverResultRow(result: result)
                            .padding(.bottom)
                        Divider()
                    }
                }
                .padding(.horizontal)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .clipped()
        }
        .frame(width: 320, height: 550, alignment: .topLeading)
        .background(race.accentColour)
        .clipShape(.rect(cornerRadius: 25, style: .circular))
    }
}

#Preview {
    RacesCard(
        race: Race(
            name: "British Grand Prix",
            date: "Sun 7th July, 15:00",
            circuit: Circuit.sample,
            colour: Color(red: 9 / 255, green: 32 / 255, blue: 96 / 255),
            accentColour: Color(red: 130 / 255, green: 30 / 255, blue: 55 / 255).opacity(0.5)
        ), driverResults: DriverResult.sample
    )
}
