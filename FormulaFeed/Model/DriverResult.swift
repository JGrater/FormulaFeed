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
    let driver: Driver
    let lapTime: String
}
