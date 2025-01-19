//
//  DriverResultRow.swift
//  FormulaFeed
//
//  Created by Jason Grater on 18/12/2024.
//

import SwiftUI

struct DriverResultRow: View {
    let result: DriverResult
    
    var body: some View {
        HStack {
            Text("\(result.position)") // Driver position
                .frame(width: 30, alignment: .center)
                .bold()
                    
            ZStack(alignment: .topLeading) {
                Text(result.driver.name)
                    .font(.subheadline)// Driver name
                Text(result.driver.team.name)
                    .font(.caption)
                    .opacity(0.7)
                    .offset(y: 16)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
                    
            Text(result.lapTime) // Lap time
                .frame(width: 80, alignment: .trailing)
        }
        .padding(.vertical, 3)
        .foregroundColor(.black)
    }
}

#Preview {
    DriverResultRow(result: DriverResult(
        position: 1,
        driver: Driver(
            name: "Max Verstappen",
            team: Team(name: "Redbull Racing", country: "Austrian", logo: Image("redbull")),
            nationality: "Dutch",
            number: 1,
            photo: Image("verstappen")
        ),
        lapTime: "1:55.0"
    ))
}
