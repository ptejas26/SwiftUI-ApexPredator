//
//  PredatorDetail.swift
//  ApexPredator
//
//  Created by Tejas on 2023-05-28.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    var body: some View {
        ScrollView {
            
            VStack {
                
                VStack(alignment: .trailing) {
                    Image(predator.type!)
                        .resizable()
                        .scaledToFit()
                    Image((predator.name?.lowercased().filter { $0 != " "})!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/4)
                        .shadow(color: .black, radius: 6, x: 0, y: 0)
                        .offset(y: -210)
                        .rotation3DEffect(.degrees(180),axis: (x: 0.0, y: 1.0, z: 0.0))
                    
                }
                Text(predator.name ?? "Name")
                    .font(.title)
            }
            
//            Using Z Stack
//            ZStack {
//                Image(predator.type!)
//                    .resizable()
//                    .scaledToFit()
//                Image((predator.name?.lowercased().filter { $0 != " "})!)
//                    .resizable()
//                    .scaledToFit()
//                    .shadow(color: .black, radius: 6, x: 0, y: 0)
//                    .offset(x: -90, y: 40)
//                    .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/3)
//                    .rotation3DEffect(
//                        .degrees(180),
//                        axis: (x: 0.0, y: 1.0, z: 0.0)
//                    )
//            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct PredatorDetail_Previews: PreviewProvider {
    static var previews: some View {
        PredatorDetail(predator: ApexPredator(id: 3, link: "", movieScenes: [], movies: ["Movie"], name: "Brachiosaurus", type: "land"))
            .preferredColorScheme(.dark)
    }
}
