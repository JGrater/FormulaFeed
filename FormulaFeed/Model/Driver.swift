//
//  Driver.swift
//  FormulaFeed
//
//  Created by Jason Grater on 03/01/2025.
//

import Foundation
import SwiftUI

struct Driver {
    let id = UUID()
    let name: String
    let team: Team
    let nationality: String
    let number: Int
    let photo: Image
}

extension Driver {
    static var sample: Driver {
        Driver(
            name: "Max Verstappen",
            team: Team.sample,
            nationality: "Dutch",
            number: 1,
            photo: Image("verstappen")
        )
    }
}
