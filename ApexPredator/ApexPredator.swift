//
//  ApexPredator.swift
//  ApexPredator
//
//  Created by Tejas on 2023-05-27.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable {
    
    internal init(id: Int? = nil, link: String? = nil, movieScenes: [MovieScene]? = nil, movies: [String]? = nil, name: String? = nil, type: String? = nil) {
        self.id = id
        self.link = link
        self.movieScenes = movieScenes
        self.movies = movies
        self.name = name
        self.type = type
    }
    
    
    let id : Int?
    let link : String?
    let movieScenes : [MovieScene]?
    let movies : [String]?
    let name : String?
    let type : String?
    
    func typeOverlay() -> Color {
        switch type?.lowercased() {
        case "land": return .brown
        case "sea": return .blue
        case "air": return .teal
        default: return .gray
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case link = "link"
        case movieScenes = "movie_scenes"
        case movies = "movies"
        case name = "name"
        case type = "type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        movieScenes = try values.decodeIfPresent([MovieScene].self, forKey: .movieScenes)
        movies = try values.decodeIfPresent([String].self, forKey: .movies)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

struct MovieScene : Codable {
    
    let id : Int?
    let movie : String?
    let sceneDescription : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case movie = "movie"
        case sceneDescription = "scene_description"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        movie = try values.decodeIfPresent(String.self, forKey: .movie)
        sceneDescription = try values.decodeIfPresent(String.self, forKey: .sceneDescription)
    }
}
