//
//  PredatorRow.swift
//  ApexPredator
//
//  Created by Tejas on 2023-05-28.
//

import SwiftUI

struct PredatorRow: View {
    let predator: ApexPredator
    
    var body: some View {
        HStack(spacing: 10) {
            Image((predator.name?.lowercased().filter { $0 != " "})!)
                .resizable()
                .frame(width: 100, height: 100)
                .shadow(color: .white.opacity(0.5), radius: 5, x: 0, y: 0)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(predator.name!)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text(predator.type!.capitalized)
                    .font(.body)
                    .frame(width: 70, height: 40)
                
//                This can also be used to draw the type
//                    .background(Color.brown)
//                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .fill(predator.typeOverlay().opacity(0.33)))
            }
        }
        .padding()
    }
        
}

struct PredatorRow_Previews: PreviewProvider {
    static var previews: some View {
        
        let apexPredator = ApexPredator(id: 3, link: "dimorphodon", name: "Dimorphodon", type: "Land")
        PredatorRow(predator: apexPredator)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
