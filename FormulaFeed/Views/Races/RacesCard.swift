//
//  RacesCard.swift
//  FormulaFeed
//
//  Created by Jason Grater on 17/12/2024.
//

import SwiftUI

struct RacesCard: View {
        
    let race: Race
    
    let driverResults: [DriverResult] = [
            DriverResult(position: 1, name: "Lewis Hamilton", team: "Mercedes", lapTime: "1:32.567"),
            DriverResult(position: 2, name: "Max Verstappen", team: "Redbull Racing", lapTime: "1:32.321"),
            DriverResult(position: 3, name: "Lando Norris", team: "McLaren", lapTime: "1:33.120"),
            DriverResult(position: 4, name: "Oscar Piastri", team: "Mclaren", lapTime: "1:33.128"),
            DriverResult(position: 5, name: "Carlos Sainz Jr.", team: "Ferrari", lapTime: "1:33.128"),
            DriverResult(position: 6, name: "Nico Hulkenburg", team: "Haas", lapTime: "1:33.128"),
            DriverResult(position: 7, name: "Lance Stroll", team: "Aston Martin", lapTime: "1:33.128"),
            DriverResult(position: 8, name: "Fernando Alonso", team: "Aston Martin", lapTime: "1:33.671"),
            DriverResult(position: 9, name: "Alex Albon", team: "Williams", lapTime: "1:33.128"),
            DriverResult(position: 10, name: "Yuki Tsunoda", team: "Racing Bulls", lapTime: "1:33.128"),
            DriverResult(position: 11, name: "Logan Sargeant", team: "Williams", lapTime: "1:33.128"),
            DriverResult(position: 12, name: "Kevin Magnussen", team: "Haas", lapTime: "1:33.128"),
            DriverResult(position: 13, name: "Daniel Riccardo", team: "Racing Bulls", lapTime: "1:33.128"),
            DriverResult(position: 14, name: "Charles Leclerc", team: "Ferrari", lapTime: "1:33.450"),
            DriverResult(position: 15, name: "Valteri Bottas", team: "Kick Sauber", lapTime: "1:33.128"),
            DriverResult(position: 16, name: "Esteban Ocon", team: "Alpine", lapTime: "1:33.128"),
            DriverResult(position: 17, name: "Sergio Perez", team: "Redbull Racing", lapTime: "1:33.128"),
            DriverResult(position: 18, name: "Zhou Guanyu", team: "Kick Sauber", lapTime: "1:33.128"),
            DriverResult(position: 19, name: "George Russell", team: "Mercedes", lapTime: "DNF"),
            DriverResult(position: 20, name: "Pierre Gasly", team: "Alpine", lapTime: "DNF")
            
        ]
    
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
    RacesCard(race: Race(
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
    ))
}
