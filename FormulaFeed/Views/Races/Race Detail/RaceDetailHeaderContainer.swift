//
//  RaceDetailHeaderContainer.swift
//  FormulaFeed
//
//  Created by Jason Grater on 22/01/2025.
//

import SwiftUI

struct RaceDetailHeaderContainer<Content: View>: View {
    @Binding var scrollOffset: CGFloat
    let content: Content
    
    init(scrollOffset: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        self._scrollOffset = scrollOffset
        self.content = content()
    }
    
    var body: some View {
        RaceDetailHeader(scrollOffset: $scrollOffset)
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    RaceDetailHeaderContainer(scrollOffset: .constant(0)) {
        ZStack {
            Color.blue.ignoresSafeArea()
            Text("Hello, World!")
                .foregroundStyle(.white)
        }
    }
}
