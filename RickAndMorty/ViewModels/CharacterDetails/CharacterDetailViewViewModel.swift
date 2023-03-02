//
//  CharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 01/03/2023.
//

import Foundation

final class CharacterDetailViewViewModel: ObservableObject {
    @Published var character: CharacterModel
    @Published var characterInfoCardViewViewModels: [CharacterInfoCardViewViewModel]
    
    init(_ character: CharacterModel) {
        self.character = character
        self.characterInfoCardViewViewModels = [
            .init(.status, character.status.rawValue),
            .init(.gender, character.gender.rawValue),
            .init(.type, character.type),
            .init(.species, character.species),
            .init(.origin, character.origin.name),
            .init(.location, character.location.name),
            .init(.episodeCount, "\(character.episode.count)"),
            .init(.created, character.created),
        ]
    }
}
