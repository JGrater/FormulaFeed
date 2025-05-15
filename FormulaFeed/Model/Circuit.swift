//
//  Circuit.swift
//  FormulaFeed
//
//  Created by Jason Grater on 07/01/2025.
//

import Foundation
import SwiftUI

struct Circuit {
    let id = UUID()
    let name: String
    let map: Image
    let country: String
    let countryFlag: Image
    let location: String
}

extension Circuit {
    static var sample: Circuit {
        Circuit(
            name: "Silverstone Circuit",
            map: Image("silverstone"),
            country: "United Kingdom",
            countryFlag: Image("britain"),
            location: "Northamptonshire"
        )
    }
}
