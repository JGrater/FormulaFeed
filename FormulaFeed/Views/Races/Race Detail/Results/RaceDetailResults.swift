//
//  RaceDetailResults.swift
//  FormulaFeed
//
//  Created by Jason Grater on 12/05/2025.
//

import SwiftUI

struct RaceDetailResults: View {
    var driverResults: [DriverResult]
    
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .center) {
                    Text("Pos")
                        .frame(width: 30, alignment: .center)
                    Text("Driver")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Time/Gap")
                        .frame(width: 80, alignment: .trailing)
                    Text("Pts")
                        .frame(width: 40, alignment: .trailing)
                }
                .foregroundStyle(.black)
                .font(.subheadline)
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(driverResults) { result in
                        DriverResultRow(result: result)
                            .padding(.bottom)
                        Divider()
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
            )
            .padding(.horizontal)
        }
    }
}

#Preview {
    RaceDetailResults(driverResults: DriverResult.sample)
}
