//
//  PredatorController.swift
//  ApexPredator
//
//  Created by Tejas on 2023-05-27.
//

import Foundation

class PredatorController {
    var apexPredator: [ApexPredator] = []
    var allApexPredator: [ApexPredator] = []

    let typeFilters = ["All", "Land", "Air", "Sea"]
    
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredator = try decoder.decode([ApexPredator].self, from: data)
                self.allApexPredator = apexPredator
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }

    func sortAlphbetically() {
        apexPredator.sort(by: { $0.name! < $1.name! })
    }

    func sortByFilmName() {
        apexPredator.sort(by: { $0.id! < $1.id! })
    }
    
    
    func filterBy(type: String, movie: String) {
        if movie == "All" && type == "All" {
            apexPredator = allApexPredator
            return
        } else if type == "All" {
            apexPredator = allApexPredator.filter({ apexPredator in
                guard let movies = apexPredator.movies else { return false }
                return movies.contains(movie)
            })
        } else if movie == "All" {
            apexPredator = allApexPredator.filter({ apexPredator in
                return apexPredator.type?.lowercased() == type.lowercased()
            })
        } else {
            apexPredator = allApexPredator.filter({ apexPredator in
                guard let movies = apexPredator.movies else { return false }
                return (movies.contains(movie) && apexPredator.type?.lowercased() == type.lowercased())
            })
        }
    }
    
    func searchForPredator(searchTerm: String) {
        apexPredator = searchTerm.isEmpty ? allApexPredator : allApexPredator.filter({ predator in
            return predator.name?.range(of: searchTerm, options: .caseInsensitive) != nil
        })
    }
    
    func isNoSearchResult() -> Bool {
        return apexPredator.isEmpty
    }
    
    @discardableResult
    func filterTitlesForMovie() -> [String] {
        let value = allApexPredator.flatMap { $0.movies! }
        var intermediateArray = Array(Set(value))
        intermediateArray.insert("All", at: 0)
        return intermediateArray
    }
    
    func typeIcon(for type: String) -> String {
        switch type {
        case "All": return "square.stack.3d.up.fill"
        case "Land": return "leaf.fill"
        case "Air": return "wind"
        case "Sea": return "drop.fill"
        default: return "questionmark"
        }
    }
}
