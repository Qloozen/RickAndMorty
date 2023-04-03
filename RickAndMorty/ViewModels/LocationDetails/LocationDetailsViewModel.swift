//
//  LocationDetailsViewModel.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 03/04/2023.
//

import Foundation

class LocationDetailsViewModel: ObservableObject {
    @Published var displayName: String = ""
    @Published var displayType: String = ""
    @Published var displayDimension: String = ""
    @Published var residents: [CharacterModel] = []
    
    private var characterUrls: [String] = []

    init(location: LocationModel) {
        displayName = location.name
        displayType = "Type: \(location.type)"
        displayDimension = "Dimension: \(location.dimension)"
        characterUrls = location.residents
        self.fetchCharacters()
    }
    
    private func fetchCharacters() {
        let group = DispatchGroup()
        for characterUrl in self.characterUrls {
            group.enter()
            APIService.shared.execute(url: characterUrl, expecting: CharacterModel.self) { result in
                defer {
                    group.leave()
                }
                
                switch result {
                case .success(let character):
                    DispatchQueue.main.async {
                        self.residents.append(character)
                    }
                case .failure:
                    break
                }
            }
        }
    }
    
    
}
