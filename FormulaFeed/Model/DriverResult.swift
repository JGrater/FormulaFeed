//
//  DriverResult.swift
//  FormulaFeed
//
//  Created by Jason Grater on 18/12/2024.
//

import Foundation
import SwiftUI

struct DriverResult: Identifiable {
    let id = UUID()
    let position: Int
    let driver: Driver
    let lapTime: String
}

extension DriverResult {
    static var sample: [DriverResult] {
        [
            DriverResult(
                position: 1, driver: Driver(
                    name: "Lewis Hamilton",
                    team: Team(name: "Mercedes", country: "German", logo: Image("mercedes")),
                    nationality: "British",
                    number: 44,
                    photo: Image("hamilton")
                ), lapTime: "1:32.567"
            ),
            DriverResult(
                position: 2, driver: Driver(
                    name: "Max Verstappen",
                    team: Team(name: "Redbull Racing", country: "Austrian", logo: Image("redbull")),
                    nationality: "Dutch",
                    number: 1,
                    photo: Image("verstappen")
                ), lapTime: "1:32.321"
            ),
            DriverResult(
                position: 3, driver: Driver(
                    name: "Lando Norris",
                    team: Team(name: "Mclaren", country: "British", logo: Image("redbull")),
                    nationality: "Dutch",
                    number: 15,
                    photo: Image("verstappen")
                ), lapTime: "1:33.120"
            ),
            DriverResult(
                position: 4, driver: Driver(
                    name: "Oscar Piastri",
                    team: Team(name: "Mclaren", country: "Austrian", logo: Image("redbull")),
                    nationality: "Australian",
                    number: 69,
                    photo: Image("verstappen")
                ), lapTime: "1:33.128"
            ),
            DriverResult(
                position: 5, driver: Driver(
                    name: "Carlos Sainz Jr.",
                    team: Team(name: "Ferrari", country: "Italian", logo: Image("ferrari")),
                    nationality: "Spanish",
                    number: 14,
                    photo: Image("leclerc")
                ), lapTime: "1:33.128"
            ),
            DriverResult(
                position: 5, driver: Driver(
                    name: "Carlos Sainz Jr.",
                    team: Team(name: "Ferrari", country: "Italian", logo: Image("ferrari")),
                    nationality: "Spanish",
                    number: 14,
                    photo: Image("leclerc")
                ), lapTime: "1:33.128"
            ),
            DriverResult(
                position: 5, driver: Driver(
                    name: "Carlos Sainz Jr.",
                    team: Team(name: "Ferrari", country: "Italian", logo: Image("ferrari")),
                    nationality: "Spanish",
                    number: 14,
                    photo: Image("leclerc")
                ), lapTime: "1:33.128"
            ),
            DriverResult(
                position: 5, driver: Driver(
                    name: "Carlos Sainz Jr.",
                    team: Team(name: "Ferrari", country: "Italian", logo: Image("ferrari")),
                    nationality: "Spanish",
                    number: 14,
                    photo: Image("leclerc")
                ), lapTime: "1:33.128"
            ),
            DriverResult(
                position: 5, driver: Driver(
                    name: "Carlos Sainz Jr.",
                    team: Team(name: "Ferrari", country: "Italian", logo: Image("ferrari")),
                    nationality: "Spanish",
                    number: 14,
                    photo: Image("leclerc")
                ), lapTime: "1:33.128"
            ),
            DriverResult(
                position: 5, driver: Driver(
                    name: "Carlos Sainz Jr.",
                    team: Team(name: "Ferrari", country: "Italian", logo: Image("ferrari")),
                    nationality: "Spanish",
                    number: 14,
                    photo: Image("leclerc")
                ), lapTime: "1:33.128"
            ),
            DriverResult(
                position: 5, driver: Driver(
                    name: "Carlos Sainz Jr.",
                    team: Team(name: "Ferrari", country: "Italian", logo: Image("ferrari")),
                    nationality: "Spanish",
                    number: 14,
                    photo: Image("leclerc")
                ), lapTime: "1:33.128"
            )
        ]
    }
}
