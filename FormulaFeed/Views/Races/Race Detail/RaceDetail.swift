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
    @State private var tabBarScrollProgress: CGFloat = .zero
    
    @State private var offsetY: CGFloat = 0
    
    @Environment(\.presentationMode) var presentationMode
        
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader {
                let size = $0.size
                let safeArea = $0.safeAreaInsets
                
                ScrollViewReader { scrollProxy in
                // Vertical Scrolling and Offset tracking
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            RaceDetailHeader(
                                offsetY: $offsetY,
                                raceDetailTabs: $raceDetailTabs,
                                selectedTab: $selectedTab,
                                tabBarScrollState: $tabBarScrollState,
                                mainViewScrollState: $mainViewScrollState,
                                tabBarScrollProgress: $tabBarScrollProgress,
                                size: size,
                                safeAreas: safeArea
                            )
                            .zIndex(1000)
                            
                            // Content pages
                            content(size: size)
                                .padding(.top, 20)
                            
                        }
                        .id("SCROLLVIEW")
                        .background {
                            ScrollDetector { offset in
                                print(-offset)
                                offsetY = -offset
                            } onDraggingEnd: { offset, velocity in
                                // Reset to initial state if not fully scrolled
                                let headerHeight = (size.height*0.45) + safeArea.top
                                let minimumHeaderHeight = 180 + safeArea.top
                                
                                let targetEnd = offset + (velocity * 45)
                                if targetEnd < (headerHeight - minimumHeaderHeight) && targetEnd > 0 {
                                    withAnimation(.interactiveSpring(response: 0.55, dampingFraction: 0.65, blendDuration: 0.65)) {
                                        scrollProxy.scrollTo("SCROLLVIEW", anchor: .top)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
            
            toolbar(offsetY: offsetY)
        }
    }
    
    @ViewBuilder
    func content(size: CGSize) -> some View {
        // Horizontal page scrolling and tracking for tab bar
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(raceDetailTabs) { tab in
                    AnyView(tab.view())
                        .frame(width: size.width)
                        .contentShape(.rect)
                
                }
            }
            .scrollTargetLayout()
            .rect { rect in
                tabBarScrollProgress = -rect.minX / size.width
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
    
    @ViewBuilder
    func toolbar(offsetY: CGFloat) -> some View {
        HStack(spacing:0) {
            // Back button
            Button(action: {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Image(systemName: "chevron.backward")
            }
            Spacer()
            // Race Title
            Text("British Grand Prix")
                .bold()
                .opacity(max(0, 1.0 + offsetY / 100.0))
            Spacer()
            // Share Button
            Button(action: {  }) {
                Image(systemName: "square.and.arrow.up")
            }
        }
        .padding(.all, 20)
        .foregroundStyle(.primary)
        .font(.headline)
        .safeAreaPadding(.top, 50)
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
    .ignoresSafeArea(.all, edges: .top)
}
