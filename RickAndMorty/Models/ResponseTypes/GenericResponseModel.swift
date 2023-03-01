//
//  GenericResponseModel.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import Foundation

struct GenericResponseModel<T: Codable>: Codable {
    let info: InfoModel
    let results: [T]
}

struct InfoModel: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
