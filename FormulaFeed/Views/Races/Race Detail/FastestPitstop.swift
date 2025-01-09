//
//  FastestPitstop.swift
//  FormulaFeed
//
//  Created by Jason Grater on 07/01/2025.
//

import SwiftUI

struct FastestPitstop: View {
    let driver: Driver
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Fastest Pit Stop")
                    .font(.title3)
                    .bold()
                    .padding(.leading, 5)
                    .padding(.bottom, 10)
                    .padding(.top, 5)
                
                HStack(alignment: .center) {
                    Logo(image: Image("redbull"))
                        .frame(width: 100)
                        .padding(5)
                    VStack(alignment: .leading) {
                        Text(driver.team.name + " | 1.90s")
                            .font(.headline)
                        HStack(alignment: .center) {
                            Text(driver.name + "  |")
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
    FastestPitstop(
        driver: Driver(
            name: "Max Verstappen",
            team: Team(name: "Redbull Racing", country: "Austrian"),
            nationality: "Dutch",
            number: 1
         )
    )
}
