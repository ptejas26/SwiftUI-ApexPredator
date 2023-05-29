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
                            Text("test")
//                            PredatorRow(predator: <#ApexPredator#>, image:"compsognathus", title: predator.name!, type: predator.type!)
                                .background(Color.black.opacity(0.5))
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
    }
}
