//
//  FlagImage.swift
//  FormulaFeed
//
//  Created by Jason Grater on 17/12/2024.
//

import SwiftUI

struct FlagImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.white, lineWidth: 3)
            }
    }
}

#Preview {
    FlagImage(image: Image("britain"))
}
