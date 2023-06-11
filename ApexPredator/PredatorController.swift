//
//  PredatorController.swift
//  ApexPredator
//
//  Created by Tejas on 2023-05-27.
//

import Foundation

class PredatorController {
    var apexPredator: [ApexPredator] = []
    
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
}
