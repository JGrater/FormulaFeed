//
//  RacesHome.swift
//  FormulaFeed
//
//  Created by Jason Grater on 17/12/2024.
//

import SwiftUI

struct RacesHome: View {
    
    let races: [Race] = [
        Race(
            name: "Bahrain Grand Prix",
            date: "Sat 2nd Mar, 15:00",
            circuit: Circuit(
                name: "Bahrain International Circuit",
                map: Image("silverstone"),
                country: "Bahrain",
                countryFlag: Image("bahrain"),
                location: ""
            ),
            colour: Color(red: 200 / 255, green: 60 / 255, blue: 40 / 255),
            accentColour: Color(red: 230 / 255, green: 160 / 255, blue: 150 / 255)
        ),
        
        Race(
            name: "Saudi Arabian Grand Prix",
            date: "Sat 9th Mar, 17:00",
            circuit: Circuit(
                name: "Jeddah Corniche Circuit",
                map: Image("silverstone"),
                country: "Saudi Arabia",
                countryFlag: Image("arabia"),
                location: ""
            ),
            colour: Color(red: 30 / 255, green: 80 / 255, blue: 50 / 255),
            accentColour: Color(red: 140 / 255, green: 170 / 255, blue: 150 / 255)
        ),
        
        Race(
            name: "Australian Grand Prix",
            date: "Sat 9th Mar, 17:00",
            circuit: Circuit(
                name: "Melbourne Grand Prix Circuit",
                map: Image("silverstone"),
                country: "Australia",
                countryFlag: Image("australia"),
                location: ""
            ),
            colour: Color(red: 10 / 255, green: 30 / 255, blue: 95 / 255),
            accentColour: Color(red: 130 / 255, green: 140 / 255, blue: 170 / 255)
        ),
        
        Race(
            name: "Japanese Grand Prix",
            date: "Sun 7th Apr, 06:00",
            circuit: Circuit(
                name: "Suzuka Circuit",
                map: Image("silverstone"),
                country: "Japan",
                countryFlag: Image("japan"),
                location: ""
            ),
            colour: Color(red: 170 / 255, green: 35 / 255, blue: 50 / 255),
            accentColour: Color(red: 215 / 255, green: 150 / 255, blue: 150 / 255)
        ),
        
        Race(
            name: "Chinese Grand Prix",
            date: "Sun 21st Apr, 08:00",
            circuit: Circuit(
                name: "Shanghai International Circuit",
                map: Image("silverstone"),
                country: "China",
                countryFlag: Image("china"),
                location: ""
            ),
            colour: Color(red: 220 / 255, green: 50 / 255, blue: 50 / 255),
            accentColour: Color(red: 235 / 255, green: 160 / 255, blue: 150 / 255)
        ),
        
        Race(
            name: "Miami Grand Prix",
            date: "Sun 5th Oct, 21:00",
            circuit: Circuit(
                name: "Miami International Autodrome",
                map: Image("silverstone"),
                country: "United States of America",
                countryFlag: Image("usa"),
                location: ""
            ),
            colour: Color(red: 10 / 255, green: 30 / 255, blue: 95 / 255),
            accentColour: Color(red: 130 / 255, green: 140 / 255, blue: 170 / 255)
        ),
        
        Race(
            name: "Emilia Romagna Grand Prix",
            date: "Sun 19th May, 14:00",
            circuit: Circuit(
                name: "Autodromo Enzo e Dino Ferrari",
                map: Image("silverstone"),
                country: "Italy",
                countryFlag: Image("italy"),
                location: ""
            ),
            colour: Color(red: 65 / 255, green: 145 / 255, blue: 80 / 255),
            accentColour: Color(red: 160 / 255, green: 200 / 255, blue: 167 / 255)
        ),
        
        Race(
            name: "Monaco Grand Prix",
            date: "Sun 26th May, 14:00",
            circuit: Circuit(
                name: "Circuit de Monaco",
                map: Image("silverstone"),
                country: "Monaco",
                countryFlag: Image("monaco"),
                location: ""
            ),
            colour: Color(red: 190 / 255, green: 40 / 255, blue: 40 / 255),
            accentColour: Color(red: 230 / 255, green: 160 / 255, blue: 150 / 255)
        ),
        
        Race(
            name: "Canadian Grand Prix",
            date: "Sun 9th June, 19:00",
            circuit: Circuit(
                name: "Circuit Gilles Villeneuve",
                map: Image("silverstone"),
                country: "Canada",
                countryFlag: Image("canada"),
                location: ""
            ),
            colour: Color(red: 195 / 255, green: 60 / 255, blue: 45 / 255),
            accentColour: Color(red: 230 / 255, green: 160 / 255, blue: 150 / 255)
        ),
        
        Race(
            name: "Spanish Grand Prix",
            date: "Sun 23rd June, 14:00",
            circuit: Circuit(
                name: "Circuit de Barcelona-Catalunya",
                map: Image("silverstone"),
                country: "Spain",
                countryFlag: Image("spain"),
                location: ""
            ),
            colour: Color(red: 250 / 255, green: 200 / 255, blue: 50 / 255),
            accentColour: Color(red: 250 / 255, green: 230 / 255, blue: 165 / 255)
        ),
        
        Race(
            name: "Austrian Grand Prix",
            date: "Sun 30th June, 14:00",
            circuit: Circuit(
                name: "Red Bull Ring",
                map: Image("silverstone"),
                country: "Austria",
                countryFlag: Image("austria"),
                location: ""
            ),
            colour: Color(red: 185 / 255, green: 40 / 255, blue: 50 / 255),
            accentColour: Color(red: 230 / 255, green: 160 / 255, blue: 150 / 255)
        ),
        
        Race(
            name: "British Grand Prix",
            date: "Sun 7th July, 15:00",
            circuit: Circuit(
                name: "Silverstone Circuit",
                map: Image("silverstone"),
                country: "United Kingdom",
                countryFlag: Image("britain"),
                location: ""
            ),
            colour: Color(red: 9 / 255, green: 32 / 255, blue: 96 / 255),
            accentColour: Color(red: 130 / 255, green: 30 / 255, blue: 55 / 255)
        ),
        
        Race(
            name: "Belgian Grand Prix",
            date: "Sun 28th Jul, 14:00",
            circuit: Circuit(
                name: "Spa-Francochamps",
                map: Image("silverstone"),
                country: "Belgium",
                countryFlag: Image("belgium"),
                location: ""
            ),
            colour: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255),
            accentColour: Color(red: 130 / 255, green: 130 / 255, blue: 130 / 255)
        ),
        
        Race(
            name: "Dutch Grand Prix",
            date: "Sun 25th Aug, 14:00",
            circuit: Circuit(
                name: "Circuit Zandvoort",
                map: Image("silverstone"),
                country: "Netherlands",
                countryFlag: Image("dutch"),
                location: ""
            ),
            colour: Color(red: 240 / 255, green: 160 / 255, blue: 60 / 255),
            accentColour: Color(red: 250 / 255, green: 210 / 255, blue: 160 / 255)
        ),
        
        Race(
            name: "Italian Grand Prix",
            date: "Sun 1st Sept, 14:00",
            circuit: Circuit(
                name: "Autdromo Nazionale Monza",
                map: Image("silverstone"),
                country: "Italy",
                countryFlag: Image("italy"),
                location: ""
            ),
            colour: Color(red: 65 / 255, green: 145 / 255, blue: 80 / 255),
            accentColour: Color(red: 160 / 255, green: 200 / 255, blue: 167 / 255)
        ),
        
        Race(
            name: "Azerbaijan Grand Prix",
            date: "Sun 15th Sept, 12:00",
            circuit: Circuit(
                name: "Baku City Circuit",
                map: Image("silverstone"),
                country: "Azerbaijan",
                countryFlag: Image("azerbaijan"),
                location: ""
            ),
            colour: Color(red: 80 / 255, green: 180 / 255, blue: 220 / 255),
            accentColour: Color(red: 170 / 255, green: 220 / 255, blue: 235 / 255)
        ),
        
        Race(
            name: "Singapore Grand Prix",
            date: "Sun 22nd Sept, 13:00",
            circuit: Circuit(
                name: "Marina Bay Street Circuit",
                map: Image("silverstone"),
                country: "Singapore",
                countryFlag: Image("singapore"),
                location: ""
            ),
            colour: Color(red: 220 / 255, green: 60 / 255, blue: 60 / 255),
            accentColour: Color(red: 230 / 255, green: 160 / 255, blue: 150 / 255)
        ),
        
        Race(
            name: "United States Grand Prix",
            date: "Sun 20th Oct, 14:00",
            circuit: Circuit(
                name: "Circuit of the Americas",
                map: Image("silverstone"),
                country: "United States of America",
                countryFlag: Image("usa"),
                location: ""
            ),
            colour: Color(red: 10 / 255, green: 30 / 255, blue: 95 / 255),
            accentColour: Color(red: 130 / 255, green: 140 / 255, blue: 170 / 255)
        ),
        
        Race(
            name: "Mexico Grand Prix",
            date: "Sun 27th Oct, 20:00",
            circuit: Circuit(
                name: "Autodromo Hermanos Rodriguez",
                map: Image("silverstone"),
                country: "Mexico",
                countryFlag: Image("mexico"),
                location: ""
            ),
            colour: Color(red: 40 / 255, green: 100 / 255, blue: 70 / 255),
            accentColour: Color(red: 150 / 255, green: 180 / 255, blue: 160 / 255)
        ),
        
        Race(
            name: "Brazilian Grand Prix",
            date: "Sun 3rd Nov, 15:30",
            circuit: Circuit(
                name: "Autodromo Jose Carlos Pace",
                map: Image("silverstone"),
                country: "Brazil",
                countryFlag: Image("brazil"),
                location: ""
            ),
            colour: Color(red: 65 / 255, green: 150 / 255, blue: 70 / 255),
            accentColour: Color(red: 160 / 255, green: 200 / 255, blue: 167 / 255)
        ),
        
        Race(
            name: "Las Vegas Grand Prix",
            date: "Sun 24th Nov, 06:00",
            circuit: Circuit(
                name: "Las Vegas Street Circuit",
                map: Image("silverstone"),
                country: "United States of America",
                countryFlag: Image("usa"),
                location: ""
            ),
            colour: Color(red: 10 / 255, green: 30 / 255, blue: 95 / 255),
            accentColour: Color(red: 130 / 255, green: 140 / 255, blue: 170 / 255)
        ),
        
        Race(
            name: "Qatar Grand Prix",
            date: "Sun 1st Dec, 16:00",
            circuit: Circuit(
                name: "Losail Circuit",
                map: Image("silverstone"),
                country: "Qatar",
                countryFlag: Image("qatar"),
                location: ""
            ),
            colour: Color(red: 130 / 255, green: 30 / 255, blue: 55 / 255),
            accentColour: Color(red: 190 / 255, green: 145 / 255, blue: 155 / 255)
        ),
        
        Race(
            name: "Abu Dhabi Grand Prix",
            date: "Sun 8th Dec, 13:00",
            circuit: Circuit(
                name: "Yas Marina Circuit",
                map: Image("silverstone"),
                country: "United Arab Emirates",
                countryFlag: Image("uae"),
                location: ""
            ),
            colour: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255),
            accentColour: Color(red: 130 / 255, green: 130 / 255, blue: 130 / 255)
        )
        
    ]
    
    var body: some View {
        NavigationStack {
            RacesHeader()
            VStack {
                RacesCarousel(races: races)
            }
        }
    }
}

#Preview {
    RacesHome()
}
