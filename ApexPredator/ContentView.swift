//
//  ContentView.swift
//  ApexPredator
//
//  Created by Tejas on 2023-05-27.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    let apController = PredatorController()
    // Add the @State property when it is to be used on the UI and it changes the state of the view
    @State var sortAlphabetical: Bool = false
    @State var currentFilter = "All"
    @State var searchText: String
    @State var movieFilter = "All"
    
    //    struct Test: View {
    //        var body: some View {
    //            Text("Hello, World!")
    //        }
    //    }
    
    
    var body: some View {
        
        
        apController.filterBy(type: currentFilter, movie: movieFilter)
        
        if sortAlphabetical {
            apController.sortAlphbetically()
        } else {
            apController.sortByFilmName()
        }
        
        if !searchText.isEmpty {
            apController.searchForPredator(searchTerm: searchText)
        }
        
        return VStack {
            
            NavigationView
                {
                    List {
                        ForEach(apController.apexPredator) { predator in
                            NavigationLink(destination: PredatorDetail(predator: predator)) {
                                PredatorRow(predator: predator)
                                //                                .background(Color.black.opacity(0.5))
                            }.isDetailLink(true)
                        }
                    }
                    .searchable(text: $searchText, prompt: "Search your favorite predator")
                    .overlay {
                        if apController.isNoSearchResult()  {
                            if #available(iOS 17.0, *) {

                                ContentUnavailableView.search(text: self.searchText)
//                                These are the two options that lets customisation of ContentUnavailableView
//                                ContentUnavailableView(
//                                    "No Articles for \"\(self.searchText)\"",
//                                    systemImage: "doc.richtext.fill",
//                                    description: Text("Try to search for another title.")
//                                )
                            }
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
                                Picker("Filter1", selection: $movieFilter.animation())  {
                                    ForEach(apController.filterTitlesForMovie(), id: \.self) { type in
                                        HStack {
                                            Text(type)
                                            Spacer()
                                            Image(systemName: "popcorn")
                                                .resizable()
                                                .scaledToFit()
                                        }
                                    }
                                }
                            } label: {
                                Image(systemName: "slider.vertical.3")
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
        ContentView(searchText: "")
            .preferredColorScheme(.dark)
    }
}
