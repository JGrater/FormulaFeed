//
//  Podium.swift
//  FormulaFeed
//
//  Created by Jason Grater on 09/01/2025.
//

import SwiftUI

struct Podium: View {
    let podiumDrivers: [Driver]
    
    var body: some View {
        HStack {
            VStack {
                Text("2nd")
                    .bold()
                DriverAvatar(image: Image("hamilton"))
                    .frame(width: 75, height: 75)
                    .padding(5)
                Divider()
                HStack(alignment: .center) {
                    Logo(image: Image("mercedes"))
                        .frame(width: 25.0, height: 20.0)
                    Text("Hamilton")
                        .font(.headline)
                }
            }

            VStack {
                Text("1st")
                    .bold()
                DriverAvatar(image: Image("verstappen"))
                    .frame(width: 75, height: 75)
                    .padding(5)
                Divider()
                HStack(alignment: .center) {
                    Logo(image: Image("redbull"))
                        .frame(width: 25.0, height: 20.0)
                    Text("Verstappen")
                        .font(.headline)

                }
            }
            .offset(y: -50)
            
            VStack {
                Text("3rd")
                    .bold()
                DriverAvatar(image: Image("leclerc"))
                    .frame(width: 75, height: 75)
                    .padding(5)
                Divider()
                HStack(alignment: .center) {
                    Logo(image: Image("ferrari"))
                        .frame(width: 25.0, height: 20.0)
                    Text("Leclerc")
                        .font(.headline)

                }
            }
        }
    }
}

#Preview {
    Podium(podiumDrivers: [
        Driver(
            name: "Max Verstappen",
            team: Team(name: "Redbull Racing",country: "Austrian"),
            nationality: "Dutch",
            number: 1
        ),
        Driver(
            name: "Lewis Hamilton",
            team: Team(name: "Mercedes",country: "Germany"),
            nationality: "British",
            number: 44
        ),
        Driver(
            name: "Charles Leclerc",
            team: Team(name: "Ferrari",country: "Italy"),
            nationality: "Monégasque",
            number: 16
        )
    ])
}
