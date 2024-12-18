//
//  DriverResult.swift
//  FormulaFeed
//
//  Created by Jason Grater on 18/12/2024.
//

import Foundation

struct DriverResult: Identifiable {
    let id = UUID()
    let position: Int
    let name: String
    let team: String
    let lapTime: String
}
