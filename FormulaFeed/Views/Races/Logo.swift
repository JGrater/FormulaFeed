//
//  Logo.swift
//  FormulaFeed
//
//  Created by Jason Grater on 04/01/2025.
//

import SwiftUI

struct Logo: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    Logo(image: Image("redbull"))
}
