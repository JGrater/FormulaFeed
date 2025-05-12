//
//  RaceDetail.swift
//  FormulaFeed
//
//  Created by Jason Grater on 03/01/2025.
//

import SwiftUI

struct RaceDetail: View {
    let race: Race
    @State private var scrollOffset: CGFloat = 0
    @State private var raceDetailTabs: [RaceDetailTab] = [
        RaceDetailTab(id: .info) { RaceDetailInfo() },
        RaceDetailTab(id: .report) { RaceDetailReport() },
        RaceDetailTab(id: .race) { RaceDetailRace() },
        RaceDetailTab(id: .grid) { RaceDetailGrid() },
        RaceDetailTab(id: .qualifying) { RaceDetailQualifying() },
        RaceDetailTab(id: .practice) { RaceDetailPractice() },
        RaceDetailTab(id: .stats) { RaceDetailStats() },
        RaceDetailTab(id: .news) { RaceDetailNews() }
    ]
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            RaceDetailHeaderContainer(scrollOffset: $scrollOffset) {
                
                GeometryReader {
                    let size = $0.size
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 0) {
                            ForEach(raceDetailTabs) { tab in
                                ScrollView(showsIndicators: false) {
                                    AnyView(tab.view())
                                        .frame(width: size.width)
                                        .contentShape(.rect)
                                }
                                .padding(.top, 2)
                                .coordinateSpace(name: "scroll")
                                .onScrollGeometryChange(for: CGFloat.self, of: { geometry in
                                    return geometry.contentOffset.y
                                }, action: { old, new in
                                    print(new)
                                    withAnimation(.spring(response: 0.6, dampingFraction: 1, blendDuration: 0)) {
                                        if (new >= 0) {
                                            scrollOffset = new
                                        }
                                    }
                                })
                                .safeAreaPadding(.bottom, 10)
                            }
                        }
                        .scrollTargetLayout()
                        // rect progress
                    }
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.paging)
                    // scrollPosition
                    //onCHange
                }
            }
        }
    }
}

#Preview {
    RaceDetail(race: Race(
        name: "British Grand Prix",
        date: "Sun 7th July, 15:00",
        circuit: Circuit(
            name: "Silverstone Circuit",
            map: Image("silverstone"),
            country: "United Kingdom",
            countryFlag: Image("britain"),
            location: "Northamptonshire"
        ),
        colour: Color(red: 9 / 255, green: 32 / 255, blue: 96 / 255),
        accentColour: Color(red: 130 / 255, green: 30 / 255, blue: 55 / 255).opacity(0.5)
    ))
}
