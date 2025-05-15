//
//  DriverResultRow.swift
//  FormulaFeed
//
//  Created by Jason Grater on 18/12/2024.
//

import SwiftUI

struct DriverResultRow: View {
    let result: DriverResult
    let showLogo = true
    let showPoints = true
    let showTeamName = false
    
    
    var body: some View {
        HStack {
            Text("\(result.position)") // Driver position
                .frame(width: 30, alignment: .center)
                .bold()
                 
            if showLogo {
                Logo(image: Image("redbull"))
                    .frame(width: 25.0, height: 20.0)
            }
            
            ZStack(alignment: .topLeading) {
                Text(result.driver.name)
                    .font(.subheadline)// Driver name
                if showTeamName {
                    Text(result.driver.team.name)
                        .font(.caption)
                        .opacity(0.7)
                        .offset(y: 16)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
                    
            Text(result.lapTime) // Lap time
                .frame(width: 80, alignment: .trailing)
            
            if showPoints {
                Text("25")
                    .frame(width: 40, alignment: .trailing)
            }
        }
        .padding(.vertical, 3)
        .foregroundColor(.black)
    }
}

#Preview {
    DriverResultRow(result: DriverResult.sample.first!)
}
