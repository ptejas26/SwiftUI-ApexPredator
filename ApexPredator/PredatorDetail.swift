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
            VStack(alignment: .trailing) {
                Image(predator.type!)
                    .resizable()
                    .scaledToFit()
                Image((predator.name?.lowercased().filter { $0 != " "})!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/4)
                    .shadow(color: .black, radius: 16, x: 0, y: 0)
                    .offset(y: -210)
                    .rotation3DEffect(.degrees(180),axis: (x: 0.0, y: 1.0, z: 0.0))
            }
            
            VStack(alignment: .leading) {
                Text(predator.name ?? "Name")
                    .font(.largeTitle)
                    .padding(.bottom, 8)
                Text("Appears In: ")
                ForEach(predator.movies!, id: \.self) { movie in
                    Text("• " + movie)
                }
                Text("Movie Moments")
                    .font(.title)
                    .padding(.top, 15)
                ForEach(predator.movieScenes ?? []) { movieScene in
                    Text(movieScene.movie!)
                        .font(.title2)
                        .padding([.top, .bottom], 1)
                    
                    Text(movieScene.sceneDescription ?? "NA")
                        .padding(.bottom, 15)
                }
                Text("Read More:")
                    .font(.caption)
                Link(predator.link!, destination: URL(string: predator.link!)!)
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            .padding(.top, -230)
            .padding()
            
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
        PredatorDetail(predator: ApexPredator(id: 3, link: "www.example.com", movieScenes: [ MovieScene(id: 3, movie: "Movie scene", sceneDescription: "Description")], movies: ["Movie", "Movie", "Movie"], name: "Brachiosaurus", type: "land"))
            .preferredColorScheme(.dark)
    }
}
