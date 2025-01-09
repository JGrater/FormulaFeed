//
//  DriverAvatar.swift
//  FormulaFeed
//
//  Created by Jason Grater on 03/01/2025.
//

import SwiftUI

struct DriverAvatar: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(Color(white: 0.75), lineWidth: 3)
            }
    }
}

#Preview {
    DriverAvatar(image: Image("verstappen"))
}
