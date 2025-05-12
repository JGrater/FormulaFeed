//
//  Podium.swift
//  FormulaFeed
//
//  Created by Jason Grater on 09/01/2025.
//

import SwiftUI

struct Podium: View {
    let podiumDrivers: [Driver]
    @Binding var scrollOffset: CGFloat
    
    var body: some View {
        HStack {
            PodiumProfile(scrollOffset: $scrollOffset, position: 2, driver: podiumDrivers[1])

            PodiumProfile(scrollOffset: $scrollOffset, position: 1, driver: podiumDrivers[0])
            .offset(y: -50)
            
            PodiumProfile(scrollOffset: $scrollOffset, position: 3, driver: podiumDrivers[2])
        }
        .scaleEffect(max(0.5, min(0.99, 1.0 - scrollOffset / 300.0)))
        .offset(y: max(0, -50 - scrollOffset / 2))
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct PodiumProfile: View {
    @Binding var scrollOffset: CGFloat
    let position: Int
    let driver: Driver
    
    var body: some View {
        VStack {
            Text(position == 1 ? "1st" : (position == 2 ? "2nd" : "3rd"))
                .bold()
                //.opacity(max(0, 1.0 - scrollOffset / 100.0))
            DriverAvatar(image: driver.photo)
                .frame(width: 75, height: 75)
                .padding(5)
            Divider().opacity(max(0, 1.0 - scrollOffset / 100.0))
            HStack(alignment: .center) {
                Logo(image: driver.team.logo)
                    .frame(width: 15.0, height: 15.0)
                Text(driver.name.split(separator: " ").last ?? "")
                    .font(.caption)

            }
            .opacity(max(0, 1.0 - scrollOffset / 100.0))
        }
    }
}

#Preview {
    Podium(podiumDrivers: [
        Driver(
            name: "Max Verstappen",
            team: Team(name: "Redbull Racing", country: "Austrian", logo: Image("redbull")),
            nationality: "Dutch",
            number: 1,
            photo: Image("verstappen")
        ),
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
    ], scrollOffset: .constant(-10))
}
