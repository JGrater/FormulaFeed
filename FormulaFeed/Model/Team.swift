//
//  Team.swift
//  FormulaFeed
//
//  Created by Jason Grater on 03/01/2025.
//

import Foundation
import SwiftUI

struct Team {
    let id = UUID()
    let name: String
    let country: String
    let logo: Image
}

extension Team {
    static var sample: Team {
        Team(name: "Redbull Racing", country: "Austrian", logo: Image("redbull"))
    }
}
