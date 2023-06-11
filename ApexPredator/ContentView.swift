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
    @State var currentFilter = "All"
    
    var body: some View {
        
        apController.filterBy(type: currentFilter)

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
                            withAnimation {
                                sortAlphabetical.toggle()
                            }
                        } label: {
                            if sortAlphabetical {
                                Image(systemName: "film")
                            } else {
                                Image(systemName: "textformat")
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Picker("Filter", selection: $currentFilter.animation())  {
                                ForEach(apController.typeFilters, id: \.self) { type in
                                    
                                    HStack {
                                        Text(type)
                                        Spacer()
                                        Image(systemName: apController.typeIcon(for: type))
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                            }
                        } label: {
                            Image(systemName: "slider.horizontal.3")
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
