//
//  Location.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import Foundation

struct LocationModel: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
