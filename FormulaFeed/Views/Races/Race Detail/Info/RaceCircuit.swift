//
//  RaceCircuit.swift
//  FormulaFeed
//
//  Created by Jason Grater on 07/01/2025.
//

import SwiftUI

struct RaceCircuit: View {
    let circuit: Circuit
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10) {
                VStack(alignment: .leading) {
                    Text(circuit.name)
                        .font(.title3)
                        .bold()
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                    
                    Text(circuit.location + ", " + circuit.country)
                        .padding(.bottom)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.leading, 5)
                .frame(maxWidth: .infinity, alignment: .leading)

                
                
                Logo(image: Image("silverstone"))
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
        )
        .padding(.horizontal)
    }
}

#Preview {
    RaceCircuit(circuit: Circuit(
        name: "Silverstone Circuit",
        map: Image("silverstone"),
        country: "United Kingdom",
        countryFlag: Image("britain"),
        location: "Northamptonshire"
    ))
}
