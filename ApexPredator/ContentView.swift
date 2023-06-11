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
                        NavigationLink(destination: PredatorDetail(predator: predator)) {
                            PredatorRow(predator: predator)
//                                .background(Color.black.opacity(0.5))
                        }.isDetailLink(true)
                    }
                }
                .navigationTitle("Apex Predator")
            }
        }
        .padding()
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
