//
//  Podium.swift
//  FormulaFeed
//
//  Created by Jason Grater on 09/01/2025.
//

import SwiftUI

struct Podium: View {
    let podiumDrivers: [Driver]
    var progress: Double
    
    var body: some View {
        HStack {
            PodiumProfile(progress: progress, position: 2, driver: podiumDrivers[1])

            PodiumProfile(progress: progress, position: 1, driver: podiumDrivers[0])
            .offset(y: -50)
            
            PodiumProfile(progress: progress, position: 3, driver: podiumDrivers[2])
        }
        .scaleEffect(1 - (progress * 0.5))
        .offset(y: 50 * progress)
    }
}

@ViewBuilder
func PodiumProfile(progress: Double, position: Int, driver: Driver) -> some View {
    VStack {
        Text(position == 1 ? "1st" : (position == 2 ? "2nd" : "3rd"))
            .bold()
            .opacity(1 - progress)
        DriverAvatar(image: driver.photo)
            .frame(width: 75, height: 75)
            .padding(5)
        Divider()
            .opacity(1 - progress)
        HStack(alignment: .center) {
            Logo(image: driver.team.logo)
                .frame(width: 15.0, height: 15.0)
            Text(driver.name.split(separator: " ").last ?? "")
                .font(.caption)

        }
        .opacity(1 - progress)
    }
}

#Preview {
    Podium(podiumDrivers: [
        Driver.sample,
        Driver(
            name: "Lewis Hamilton",
            team: Team(name: "Mercedes",country: "Germany", logo: Image("mercedes")),
            nationality: "British",
            number: 44,
            photo: Image("hamilton")
        ),
        Driver(
            name: "Charles Leclerc",
            team: Team(name: "Ferrari",country: "Italy", logo: Image("ferrari")),
            nationality: "Monégasque",
            number: 16,
            photo: Image("leclerc")
        )
    ], progress: 0.0)
}
