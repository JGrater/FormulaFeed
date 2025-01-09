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
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(race.accentColour)
            
            VStack(spacing: 0) {
                NavigationLink {
                    RaceDetail(race: race)
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(race.colour)
                            .frame(height: 120)
                            .cornerRadius(25)
                            .offset(y: -15)
                        
                        HStack {
                            FlagImage(image: race.circuit.countryFlag)
                                .frame(width: 100, height: 40)
                            VStack(alignment: .leading) {
                                Text(race.name)
                                    .font(.headline)
                                    .bold()
                                Text(race.circuit.name)
                                    .font(.caption)
                                
                                Text(race.date)
                                    .font(.caption)
                                    .padding(.top, 5)
                            }
                            .foregroundStyle(.white)
                            Spacer()
                        }
                        .offset(y: -15)
                        .padding(.horizontal, 10)
                    }
                }
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
                        Section(header:
                            HStack {
                                Text("Pos")
                                    .frame(width: 30, alignment: .center)
                                Text("Driver")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("Lap Time")
                                    .frame(width: 80, alignment: .trailing)
                            }
                            .padding(.bottom)
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .background(race.accentColour)
                        ) {
                            ForEach(driverResults) { result in
                                DriverResultRow(result: result)
                                    .listRowBackground(Color.clear)
                                    .padding(.bottom)
                                Divider()
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 350)
                .scrollContentBackground(.hidden)
            }
        }
        .frame(width: 300, height: 500) // Fixed card size
        .clipShape(RoundedRectangle(cornerRadius: 20))
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
