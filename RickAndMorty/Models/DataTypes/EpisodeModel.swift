//
//  Episode.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import Foundation

struct EpisodeModel: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
