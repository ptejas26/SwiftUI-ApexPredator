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
    
    func filterBy(type: String) {
        if type == "All" {
            apexPredator = allApexPredator
            return
        }
        apexPredator = allApexPredator.filter { $0.type?.lowercased() == type.lowercased() }
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
