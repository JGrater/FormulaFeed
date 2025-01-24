//
//  ContentView.swift
//  FormulaFeed
//
//  Created by Jason Grater on 17/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: TabNames = .races
    
    enum TabNames {
        case races
        case news
        case standings
        case favourites
        case settings
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Tab("News", systemImage: "newspaper.fill", value: TabNames.news) {
                NewsHome()
            }
            Tab("Standings", systemImage: "trophy.fill", value: TabNames.standings) {
                StandingsHome()
            }
            Tab("Races", systemImage: "flag.checkered.2.crossed", value: TabNames.races) {
                RacesHome()
            }
            Tab("Favourites", systemImage: "star.fill", value: TabNames.favourites) {
                FavouritesHome()
            }
            Tab("Settings", systemImage: "gearshape.fill", value: TabNames.settings) {
                SettingsHome()
            }
        }
    }
}

#Preview {
    ContentView()
}
