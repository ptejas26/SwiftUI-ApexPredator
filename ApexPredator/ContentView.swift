//
//  ContentView.swift
//  ApexPredator
//
//  Created by Tejas on 2023-05-27.
//

import SwiftUI

struct ContentView: View {
    
    let apController = PredatorController()
    @State var sortAlphabetical: Bool = false
    
    var body: some View {

        if sortAlphabetical {
            apController.sortAlphbetically()
        } else {
            apController.sortByFilmName()
        }

        return VStack {
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
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            sortAlphabetical.toggle()
                        } label: {
                            if sortAlphabetical {
                                Image(systemName: "film")
                            } else {
                                Image(systemName: "textformat")
                            }
                        }
                    }
                }
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
