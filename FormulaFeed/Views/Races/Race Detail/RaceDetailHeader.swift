//
//  RaceDetailHeader.swift
//  FormulaFeed
//
//  Created by Jason Grater on 15/01/2025.
//

import SwiftUI

struct RaceDetailHeader: View {
    @Binding var scrollOffset: CGFloat
    var dismiss: DismissAction
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing:0) {
                Button(action: { withAnimation { dismiss() }) {
                    Image(systemName: "chevron.backward")
                }
                Spacer()
                Text("British Grand Prix")
                    .bold()
                    .opacity(max(0, 1.0 - scrollOffset / 100.0))
                Spacer()
                Button(action: {  }) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .center)
            
            Podium(podiumDrivers: [
                Driver(
                    name: "Max Verstappen",
                    team: Team(name: "Redbull Racing", country: "Austrian", logo: Image("redbull")),
                    nationality: "Dutch",
                    number: 1,
                    photo: Image("verstappen")
                ),
                Driver(
                    name: "Lewis Hamilton",
                    team: Team(name: "Mercedes",country: "Germany", logo: Image("mercedes")),
                    nationality: "British",
                    number: 44,
                    photo: Image("hamilton")
                ),
                Driver(
                    name: "Charles Leclerc",
                    team: Team(name: "Ferrari",country: "Italy", logo: Image("ferrari")),
                    nationality: "Monégasque",
                    number: 16,
                    photo: Image("leclerc")
                )
            ], scrollOffset: $scrollOffset)
            .frame(width: 300)
            .offset(y: max(-60, 40 - scrollOffset / 2))
            
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .frame(height: max(120, 275 - scrollOffset), alignment: .top)
        .background(.white)
        .clipShape(.rect(bottomLeadingRadius: 25, bottomTrailingRadius: 25, style: .circular))
        .shadow(radius: 1, x: 0, y: 2)
    }
}

#Preview {
    @Previewable
    @Environment(\.dismiss) var dismissAction
    RaceDetailHeader(scrollOffset: .constant(400), dismiss: dismissAction)
}
