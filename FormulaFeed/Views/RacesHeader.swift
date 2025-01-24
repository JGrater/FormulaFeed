//
//  RacesHeader.swift
//  FormulaFeed
//
//  Created by Jason Grater on 23/01/2025.
//

import SwiftUI

struct RacesHeader: View {
    var body: some View {
        VStack {
            HStack() {
                Text("FormulaFeed")
                    .frame(maxWidth:.infinity, alignment: .leading)
                
                Button(action: {
                    print("Search button tapped")
                }) {
                    Image(systemName: "magnifyingglass")
                        //.foregroundColor(.primary)
                        .font(.title3)
                }
                .frame(maxWidth:.infinity, alignment: .trailing)
            }
            HStack {
                Text("Races")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.vertical, 5)
                
                Spacer()
            }
        }
        .padding(.horizontal)
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}

#Preview {
    RacesHeader()
    Spacer()
}
