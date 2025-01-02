//
//  RacesHome.swift
//  FormulaFeed
//
//  Created by Jason Grater on 17/12/2024.
//

import SwiftUI

struct RacesHome: View {
    
    let races: [Race] = [
        Race(name: "Bahrain Grand Prix", date: "Sat 2nd Mar, 15:00", circuit: "Bahrain International Circuit", flag: Image("bahrain"), countryColour: Color(red: 200 / 255, green: 60 / 255, blue: 40 / 255), countryAccentColour: Color(red: 230 / 255, green: 160 / 255, blue: 150 / 255)),
        
        Race(name: "Saudi Arabian Grand Prix", date: "Sat 9th Mar, 17:00", circuit: "Jeddah Corniche Circuit", flag: Image("arabia"), countryColour: Color(red: 30 / 255, green: 80 / 255, blue: 50 / 255), countryAccentColour: Color(red: 140 / 255, green: 170 / 255, blue: 150 / 255)),
        
        Race(name: "Australian Grand Prix", date: "Sat 9th Mar, 17:00", circuit: "Melbourne Grand Prix Circuit", flag: Image("australia"), countryColour: Color(red: 10 / 255, green: 30 / 255, blue: 95 / 255), countryAccentColour: Color(red: 130 / 255, green: 140 / 255, blue: 170 / 255)),
        
        Race(name: "Japanese Grand Prix", date: "Sun 7th Apr, 06:00", circuit: "Suzuka Circuit", flag: Image("japan"), countryColour: Color(red: 170 / 255, green: 35 / 255, blue: 50 / 255), countryAccentColour: Color(red: 215 / 255, green: 150 / 255, blue: 150 / 255)),
        
        Race(name: "Chinese Grand Prix", date: "Sun 21st Apr, 08:00", circuit: "Shaghai International Circuit", flag: Image("china"), countryColour: Color(red: 220 / 255, green: 50 / 255, blue: 50 / 255), countryAccentColour: Color(red: 235 / 255, green: 160 / 255, blue: 150 / 255)),
        
        Race(name: "Miami Grand Prix", date: "Sun 5th Oct, 21:00", circuit: "Miami International Autodrome", flag: Image("usa"), countryColour: Color(red: 10 / 255, green: 30 / 255, blue: 95 / 255), countryAccentColour: Color(red: 130 / 255, green: 140 / 255, blue: 170 / 255)),
        
        Race(name: "Emilia Romagna Grand Prix", date: "Sun 19th May, 14:00", circuit: "Autodromo Enzo e Dino Ferrari", flag: Image("italy"), countryColour: Color(red: 65 / 255, green: 145 / 255, blue: 80 / 255), countryAccentColour: Color(red: 160 / 255, green: 200 / 255, blue: 167 / 255)),
        
        Race(name: "Monaco Grand Prix", date: "Sun 26th May, 14:00", circuit: "Circuit de Monaco", flag: Image("monaco"), countryColour: Color(red: 190 / 255, green: 40 / 255, blue: 40 / 255), countryAccentColour: Color(red: 230 / 255, green: 160 / 255, blue: 150 / 255)),
        
        Race(name: "Canadian Grand Prix", date: "Sun 9th June, 19:00", circuit: "Circuit Gilles Villeneuve", flag: Image("canada"), countryColour: Color(red: 195 / 255, green: 60 / 255, blue: 45 / 255), countryAccentColour: Color(red: 230 / 255, green: 160 / 255, blue: 150 / 255)),
        
        Race(name: "Spanish Grand Prix", date: "Sun 23rd June, 14:00", circuit: "Circuit de Barcelona-Catalunya", flag: Image("spain"), countryColour: Color(red: 250 / 255, green: 200 / 255, blue: 50 / 255), countryAccentColour: Color(red: 250 / 255, green: 230 / 255, blue: 165 / 255)),
        
        Race(name: "Austrian Grand Prix", date: "Sun 30th June, 14:00", circuit: "Red Bull Ring", flag: Image("austria"), countryColour: Color(red: 185 / 255, green: 40 / 255, blue: 50 / 255), countryAccentColour: Color(red: 230 / 255, green: 160 / 255, blue: 150 / 255)),
        
        Race(name: "British Grand Prix", date: "Sun 7th Jul, 15:00", circuit: "Silverstone Circuit", flag: Image("britain"), countryColour: Color(red: 210 / 255, green: 15 / 255, blue: 40 / 255), countryAccentColour: Color(red: 230 / 255, green: 140 / 255, blue: 150 / 255)),
        
        Race(name: "Belgian Grand Prix", date: "Sun 28th Jul, 14:00", circuit: "Spa-Francochamps", flag: Image("belgium"), countryColour: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255), countryAccentColour: Color(red: 130 / 255, green: 130 / 255, blue: 130 / 255)),
        
        Race(name: "Dutch Grand Prix", date: "Sun 25th Aug, 14:00", circuit: "Circuit Zandvoort", flag: Image("dutch"), countryColour: Color(red: 240 / 255, green: 160 / 255, blue: 60 / 255), countryAccentColour: Color(red: 250 / 255, green: 210 / 255, blue: 160 / 255)),
        
        Race(name: "Italian Grand Prix", date: "Sun 1st Sept, 14:00", circuit: "Autdromo Nazionale Monza", flag: Image("italy"), countryColour: Color(red: 65 / 255, green: 145 / 255, blue: 80 / 255), countryAccentColour: Color(red: 160 / 255, green: 200 / 255, blue: 167 / 255)),
        
        Race(name: "Azerbaijan Grand Prix", date: "Sun 15th Sept, 12:00", circuit: "Autdromo Nazionale Monza", flag: Image("azerbaijan"), countryColour: Color(red: 80 / 255, green: 180 / 255, blue: 220 / 255), countryAccentColour: Color(red: 170 / 255, green: 220 / 255, blue: 235 / 255)),
        
        Race(name: "Singapore Grand Prix", date: "Sun 22nd Sept, 13:00", circuit: "Marina Bay Street Circuit", flag: Image("singapore"), countryColour: Color(red: 220 / 255, green: 60 / 255, blue: 60 / 255), countryAccentColour: Color(red: 230 / 255, green: 160 / 255, blue: 150 / 255)),
        
        Race(name: "United States Grand Prix", date: "Sun 20th Oct, 14:00", circuit: "Circuit of the Americas", flag: Image("usa"), countryColour: Color(red: 10 / 255, green: 30 / 255, blue: 95 / 255), countryAccentColour: Color(red: 130 / 255, green: 140 / 255, blue: 170 / 255)),
        
        Race(name: "Mexico Grand Prix", date: "Sun 27th Oct, 20:00", circuit: "Autodromo Hermanos Rodriguez", flag: Image("mexico"), countryColour: Color(red: 40 / 255, green: 100 / 255, blue: 70 / 255), countryAccentColour: Color(red: 150 / 255, green: 180 / 255, blue: 160 / 255)),
        
        Race(name: "Brazilian Grand Prix", date: "Sun 3rd Nov, 15:30", circuit: "Autodromo Jose Carlos Pace", flag: Image("brazil"), countryColour: Color(red: 65 / 255, green: 150 / 255, blue: 70 / 255), countryAccentColour: Color(red: 160 / 255, green: 200 / 255, blue: 167 / 255)),
        
        Race(name: "Las Vegas Grand Prix", date: "Sun 24th Nov, 06:00", circuit: "Las Vegas Street Circuit", flag: Image("usa"), countryColour: Color(red: 10 / 255, green: 30 / 255, blue: 95 / 255), countryAccentColour: Color(red: 130 / 255, green: 140 / 255, blue: 170 / 255)),
        
        Race(name: "Qatar Grand Prix", date: "Sun 1st Dec, 16:00", circuit: "Losail Circuit", flag: Image("qatar"), countryColour: Color(red: 130 / 255, green: 30 / 255, blue: 55 / 255), countryAccentColour: Color(red: 190 / 255, green: 145 / 255, blue: 155 / 255)),
        
        Race(name: "Abu Dhabi Grand Prix", date: "Sun 8th Dec, 13:00", circuit: "Yas Marina Circuit", flag: Image("uae"), countryColour: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255), countryAccentColour: Color(red: 130 / 255, green: 130 / 255, blue: 130 / 255)),
        
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                RacesCarousel(races: races)
            }
            .navigationTitle("Races")
            .toolbar {
                Button {
                    
                } label: {
                    Label("Search", systemImage: "magnifyingglass")
                }
            }
        }
    }
}

#Preview {
    RacesHome()
}
