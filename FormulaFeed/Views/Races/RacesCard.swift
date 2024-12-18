//
//  RacesCard.swift
//  FormulaFeed
//
//  Created by Jason Grater on 17/12/2024.
//

import SwiftUI

struct RacesCard: View {
    
    let driverResults: [DriverResult] = [
            DriverResult(position: 1, name: "Max Verstappen", team: "Redbull Racing", lapTime: "1:32.321"),
            DriverResult(position: 2, name: "Lewis Hamilton", team: "Mercedes", lapTime: "1:32.567"),
            DriverResult(position: 3, name: "Lando Norris", team: "McLaren", lapTime: "1:33.120"),
            DriverResult(position: 4, name: "Charles Leclerc", team: "Ferrari", lapTime: "1:33.450"),
            DriverResult(position: 5, name: "Fernando Alonso", team: "Aston Martin", lapTime: "1:33.671")
        ]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(red: 230 / 255, green: 140 / 255, blue: 150 / 255))
            
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 207 / 255, green: 16 / 255, blue: 41 / 255))
                        .frame(height: 120)
                        .cornerRadius(25)
                        .offset(y: -15)
                    
                    HStack {
                        FlagImage(image: Image("britishFlag"))
                            .frame(width: 100, height: 40)
                        VStack(alignment: .leading) {
                            Text("British Grand Prix")
                                .font(.headline)
                                .bold()
                            Text("Silverstone Circuit")
                                .font(.subheadline)
                            
                            Text("Sun 7th July, 15:00")
                                .font(.caption)
                                .padding(.top, 5)
                        }
                        .foregroundStyle(.white)
                        Spacer()
                    }
                    .offset(y: -15)
                    .padding(.horizontal, 10)
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
                            .background(Color(red: 230 / 255, green: 140 / 255, blue: 150 / 255))
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
    RacesCard()
}
