//
//  RaceDetail.swift
//  FormulaFeed
//
//  Created by Jason Grater on 03/01/2025.
//

import SwiftUI

struct RaceDetail: View {
    let race: Race
    let driverResults: [DriverResult]
    @State private var scrollOffset: CGFloat = 0
    @State private var raceDetailTabs: [RaceDetailTab] = [
        RaceDetailTab(id: .info) { RaceDetailInfo() },
        RaceDetailTab(id: .report) { RaceDetailReport() },
        RaceDetailTab(id: .results) { RaceDetailResults(driverResults: DriverResult.sample) },
        RaceDetailTab(id: .grid) { RaceDetailGrid() },
        RaceDetailTab(id: .stats) { RaceDetailStats() },
        RaceDetailTab(id: .news) { RaceDetailNews() }
    ]
    @State private var selectedTab: RaceDetailTab.Tab = .info
    @State private var tabBarScrollState: RaceDetailTab.Tab?
    @State private var mainViewScrollState: RaceDetailTab.Tab?
    @State private var progress: CGFloat = .zero
    
    private let maxHeaderOffset: CGFloat = 155
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            RaceDetailHeaderContainer(
                scrollOffset: $scrollOffset,
                tabs: $raceDetailTabs,
                selectedTab: $selectedTab,
                tabBarScrollState: $tabBarScrollState,
                mainViewScrollState: $mainViewScrollState,
                progress: $progress
            ) {
                
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
                                            scrollOffset = min(new, maxHeaderOffset)
                                        } else {
                                            scrollOffset = 0
                                        }
                                    }
                                })
                                .safeAreaPadding(.bottom, 10)
                            }
                        }
                        .scrollTargetLayout()
                        .rect { rect in
                            progress = -rect.minX / size.width
                        }
                    }
                    .scrollPosition(id: $mainViewScrollState)
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.paging)
                    .onChange(of: mainViewScrollState) { old, new in
                        if let new {
                            withAnimation(.snappy) {
                                tabBarScrollState = new
                                selectedTab = new
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RaceDetail(race: Race(
        name: "British Grand Prix",
        date: "Sun 7th July, 15:00",
        circuit: Circuit.sample,
        colour: Color(red: 9 / 255, green: 32 / 255, blue: 96 / 255),
        accentColour: Color(red: 130 / 255, green: 30 / 255, blue: 55 / 255).opacity(0.5)
    ), driverResults: DriverResult.sample)
}
