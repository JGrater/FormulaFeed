//
//  FastestLap.swift
//  FormulaFeed
//
//  Created by Jason Grater on 07/01/2025.
//

import SwiftUI

struct FastestLap: View {
    let driver: Driver

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Fastest Lap")
                    .font(.title3)
                    .bold()
                    .padding(.leading, 5)
                    .padding(.bottom, 10)
                    .padding(.top, 5)
                
                HStack(alignment: .top) {
                    DriverAvatar(image: Image("verstappen"))
                        .frame(width: 75, height: 75)
                        .padding(5)
                    VStack(alignment: .leading) {
                        Text(driver.name + "  |  1:51.51")
                            .font(.headline)
                        HStack(alignment: .center) {
                            Logo(image: Image("redbull"))
                                .frame(width: 25.0, height: 20.0)
                            Text(driver.team.name + "  |")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            Logo(image: Image("verstappenNumber"))
                                .frame(width: 10, height: 10)
                                
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical)
                }
                .padding(.bottom, 10)
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
    FastestLap(driver:
        Driver(
            name: "Max Verstappen",
            team: Team(name: "Redbull Racing", country: "Austrian"),
            nationality: "Dutch",
            number: 1
        )
    )
}
