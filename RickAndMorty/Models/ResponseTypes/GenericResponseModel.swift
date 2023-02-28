//
//  GenericResponseModel.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import Foundation

struct GenericResponseModel<T> {
    let info: InfoModel
    let results: [T]
}

struct InfoModel {
    let count: Int
    let pages: Int
    let next: String
    let prev: String
}
