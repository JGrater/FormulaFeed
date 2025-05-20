//
//  RaceDetailHeader.swift
//  FormulaFeed
//
//  Created by Jason Grater on 15/01/2025.
//

import SwiftUI

struct RaceDetailHeader: View {
    @Binding var offsetY: CGFloat
    
    @Binding var raceDetailTabs: [RaceDetailTab]
    @Binding var selectedTab: RaceDetailTab.Tab
    @Binding var tabBarScrollState: RaceDetailTab.Tab?
    @Binding var mainViewScrollState: RaceDetailTab.Tab?
    @Binding var tabBarScrollProgress: CGFloat
    
    var size: CGSize
    var safeAreas: EdgeInsets

    var body: some View {
        let headerHeight = (size.height*0.45) + safeAreas.top
        let minimumHeaderHeight = 180 + safeAreas.top
        // Progress 1.0 to 0.0
        let progress = max(min(-offsetY / (headerHeight - minimumHeaderHeight), 1), 0)
        
        GeometryReader { _ in
            ZStack {
                // Background
                Rectangle()
                    .fill(Color(.systemBackground))
                
                VStack(alignment: .center, spacing: 15) {
                    // Spacer
                    Rectangle()
                        .fill(Color.clear)
                    
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
                    ], progress: progress)
                    .frame(width: 350)
                
                    RaceDetailTabBar(
                         tabs: $raceDetailTabs,
                         selectedTab: $selectedTab,
                         tabBarScrollState: $tabBarScrollState,
                         mainViewScrollState: $mainViewScrollState,
                         progress: $tabBarScrollProgress
                    )
                }
                .padding(.top, safeAreas.top)
                .padding(.bottom, -15)
                
            }
            .frame(height: (headerHeight + offsetY) < minimumHeaderHeight ? minimumHeaderHeight : (headerHeight + offsetY), alignment: .bottom)
            .offset(y: -offsetY)
        }
        .frame(height: headerHeight)
        
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
    
    GeometryReader {
        let size = $0.size
        let safeArea = $0.safeAreaInsets
        
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            VStack {
                RaceDetailHeader(
                    offsetY: .constant(0),
                    raceDetailTabs: $raceDetailTabs,
                    selectedTab: $selectedTab,
                    tabBarScrollState: $tabBarScrollState,
                    mainViewScrollState: $mainViewScrollState,
                    tabBarScrollProgress: $progress,
                    size: size,
                    safeAreas: safeArea
                )
                Spacer()
            }
        }
    }
}
