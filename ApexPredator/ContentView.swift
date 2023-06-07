//
//  ContentView.swift
//  ApexPredator
//
//  Created by Tejas on 2023-05-27.
//

import SwiftUI

struct ContentView: View {
    
    let apController = PredatorController()
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(apController.apexPredator) { predator in
                        NavigationLink(destination: Text("Dino Details page")) {
                            PredatorRow(predator: predator)
//                                .background(Color.black.opacity(0.5))
                        }
                    }
                }
                .navigationTitle("Apex Predator")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
