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
                    .stroke(.black, lineWidth: 3)
            }
    }
}

#Preview {
    DriverAvatar(image: Image("verstappen"))
}
