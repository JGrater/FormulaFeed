//
//  RaceDetailHeaderContainer.swift
//  FormulaFeed
//
//  Created by Jason Grater on 22/01/2025.
//

import SwiftUI

struct RaceDetailHeaderContainer<Content: View>: View {
    @Binding var scrollOffset: CGFloat
    @Binding var tabs: [RaceDetailTab]
    @Binding var selectedTab: RaceDetailTab.Tab
    @Binding var tabBarScrollState: RaceDetailTab.Tab?
    @Binding var mainViewScrollState: RaceDetailTab.Tab?
    @Binding var progress: CGFloat
    let content: Content
    
    init(
        scrollOffset: Binding<CGFloat>,
        tabs: Binding<[RaceDetailTab]>,
        selectedTab: Binding<RaceDetailTab.Tab>,
        tabBarScrollState: Binding<RaceDetailTab.Tab?>,
        mainViewScrollState: Binding<RaceDetailTab.Tab?>,
        progress: Binding<CGFloat>,
        @ViewBuilder content: () -> Content
    ) {
        self._scrollOffset = scrollOffset
        self._tabs = tabs
        self._selectedTab = selectedTab
        self._tabBarScrollState = tabBarScrollState
        self._mainViewScrollState = mainViewScrollState
        self._progress = progress
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Color(.systemBackground).ignoresSafeArea(edges: .top)
                .frame(height: 0)
            RaceDetailHeader(scrollOffset: $scrollOffset)
            RaceDetailTabBar(
                tabs: $tabs,
                selectedTab: $selectedTab,
                tabBarScrollState: $tabBarScrollState,
                mainViewScrollState: $mainViewScrollState,
                progress: $progress
            )
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    @Previewable @State var raceDetailTabs: [RaceDetailTab] = [
        RaceDetailTab(id: .info) { RaceDetailInfo() },
        RaceDetailTab(id: .report) { RaceDetailReport() },
        RaceDetailTab(id: .results) { RaceDetailResults(driverResults: DriverResult.sample) },
        RaceDetailTab(id: .grid) { RaceDetailGrid() },
        RaceDetailTab(id: .stats) { RaceDetailStats() },
        RaceDetailTab(id: .news) { RaceDetailNews() }
    ]
    
    @Previewable @State var selectedTab: RaceDetailTab.Tab = .info
    @Previewable @State var tabBarScrollState: RaceDetailTab.Tab?
    @Previewable @State var mainViewScrollState: RaceDetailTab.Tab?
    @Previewable @State var progress: CGFloat = .zero
    
    ZStack {
        Color.blue.ignoresSafeArea()
        RaceDetailHeaderContainer(
            scrollOffset: .constant(0),
            tabs: $raceDetailTabs,
            selectedTab: $selectedTab,
            tabBarScrollState: $tabBarScrollState,
            mainViewScrollState: $mainViewScrollState,
            progress: $progress
        ) {
            ZStack {
                Text("Hello, World!")
                    .foregroundStyle(.white)
            }
        }
    }
    
}
