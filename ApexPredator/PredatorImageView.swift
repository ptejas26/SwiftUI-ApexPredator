//
//  PredatorImageView.swift
//  ApexPredator
//
//  Created by Tejas on 2023-06-11.
//

import SwiftUI

struct PredatorImageView: View {
    let predatorImage: String
    var body: some View {
        Image(predatorImage)
            .resizable()
            .scaledToFit()
            .rotation3DEffect(.degrees(180),axis: (x: 0.0, y: 1.0, z: 0.0))

    }
}


struct PredatorImageView_Previews: PreviewProvider {
    static var previews: some View {
        PredatorImageView(predatorImage: "tyrannosaurusrex")
            .preferredColorScheme(.dark)
    }
}
