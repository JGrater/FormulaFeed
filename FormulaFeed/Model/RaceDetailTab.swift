//
//  RaceDetailTab.swift
//  FormulaFeed
//
//  Created by Jason Grater on 28/01/2025.
//

import Foundation
import SwiftUI

struct RaceDetailTab: Identifiable {
    let id: Tab
    var view: () -> any View
    var size: CGSize = .zero
    var minX: CGFloat = .zero
        
    enum Tab: String, CaseIterable {
        case info = "Info"
        case report = "Report"
        case results = "Results"
        case grid = "Grid"
        case stats = "Stats"
        case news = "News"
    }
    
    init(id: Tab, view: @escaping () -> any View) {
        self.id = id
        self.view = view
    }
    
}
