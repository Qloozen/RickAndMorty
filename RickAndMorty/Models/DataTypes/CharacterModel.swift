//
//  Character.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import Foundation

struct CharacterModel: Codable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String
    let gender: Gender
    let origin: CharacterLocationModel
    let location: CharacterLocationModel
    let image: String
    let episode: [String]
    let url: String
    let created: Date
}

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}

struct CharacterLocationModel: Codable {
    let name: String
    let url: String
}
