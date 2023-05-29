//
//  PredatorRow.swift
//  ApexPredator
//
//  Created by Tejas on 2023-05-28.
//

import SwiftUI

struct PredatorRow: View {
    @State var image: String
    @State var title: String
    @State var type: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(image)
                .resizable()
                .frame(width: 100, height: 100)
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text(type)
                    .font(.body)
                    .frame(width: 70, height: 40)
                
//                This can also be used to draw the type
//                    .background(Color.brown)
//                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .fill(.brown.opacity(0.33)))
            }
        }
        .padding()
    }
        
}

struct PredatorRow_Previews: PreviewProvider {
    static var previews: some View {
        PredatorRow(image: "compsognathus", title: "Compsognathus", type: "Land")
            .previewLayout(.sizeThatFits)
    }
}
