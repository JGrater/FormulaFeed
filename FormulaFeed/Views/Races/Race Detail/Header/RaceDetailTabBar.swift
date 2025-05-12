//
//  RaceDetailTabBar.swift
//  FormulaFeed
//
//  Created by Jason Grater on 12/05/2025.
//

import SwiftUI

struct RaceDetailTabBar: View {
    @Binding var tabs: [RaceDetailTab]
    @Binding var selectedTab: RaceDetailTab.Tab
    @Binding var tabBarScrollState: RaceDetailTab.Tab?
    @Binding var mainViewScrollState: RaceDetailTab.Tab?
    @Binding var progress: CGFloat
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach($tabs) { $tab in
                    Button(action: {
                        withAnimation(.snappy) {
                            selectedTab = tab.id
                            tabBarScrollState = tab.id
                            mainViewScrollState = tab.id
                        }
                    }) {
                        Text(tab.id.rawValue)
                            .padding(.vertical, 12)
                            .foregroundStyle(selectedTab == tab.id ? Color.primary : .gray) // if not selected, grey out
                            .contentShape(.rect)
                    }
                    .buttonStyle(.plain)
                    .rect { rect in
                        tab.size = rect.size
                        tab.minX = rect.minX
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: .init(get: {
            return tabBarScrollState
        }, set: { _ in
        }), anchor: .center)
        .overlay(alignment: .bottom) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.clear)
                    .frame(height: 1)
                
                let inputRange = tabs.indices.compactMap { return CGFloat($0) }
                let outputRange = tabs.compactMap { return $0.size.width }
                let outputPositionRange = tabs.compactMap { return $0.minX }
                let indicatorWidth = progress.interpolate(inputRange: inputRange, outputRange: outputRange)
                let indicatorPosition = progress.interpolate(inputRange: inputRange, outputRange: outputPositionRange)
                
                Rectangle()
                    .fill(.primary)
                    .frame(width: indicatorWidth, height: 1.5)
                    .offset(x: indicatorPosition)
            }
        }
        .safeAreaPadding(.horizontal, 15)
        .scrollIndicators(.hidden)
        .background(Color(.systemBackground))
        .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15, style: .circular))
            .shadow(radius: 1, x: 0, y: 2)
    }
}

#Preview {
    @Previewable @State var raceDetailTabs: [RaceDetailTab] = [
        RaceDetailTab(id: .info) { RaceDetailInfo() },
        RaceDetailTab(id: .report) { RaceDetailReport() },
        RaceDetailTab(id: .race) { RaceDetailRace() },
        RaceDetailTab(id: .grid) { RaceDetailGrid() },
        RaceDetailTab(id: .qualifying) { RaceDetailQualifying() },
        RaceDetailTab(id: .practice) { RaceDetailPractice() },
        RaceDetailTab(id: .stats) { RaceDetailStats() },
        RaceDetailTab(id: .news) { RaceDetailNews() }
    ]
    @Previewable @State var selectedTab: RaceDetailTab.Tab = .info
    @Previewable @State var tabBarScrollState: RaceDetailTab.Tab?
    @Previewable @State var mainViewScrollState: RaceDetailTab.Tab?
    @Previewable @State var progress: CGFloat = .zero
    
    
    ZStack {
        Color.blue
            .edgesIgnoringSafeArea(.all)
        
        RaceDetailTabBar(
                tabs: $raceDetailTabs,
                selectedTab: $selectedTab,
                tabBarScrollState: $tabBarScrollState,
                mainViewScrollState: $mainViewScrollState,
                progress: $progress
        )
    }
    
}
