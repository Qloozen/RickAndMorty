//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import Foundation

final class CharacterListViewModel: ObservableObject {
    @Published var characters: [CharacterModel] = []
    
    init() {
        self.fetchCharacters()
    }
    
    private func fetchCharacters() {
        let url = "\(APIService.baseUrl)\(APIEndpoint.character.rawValue)"
        APIService.shared.execute(
            url: url,
            expecting: GenericResponseModel<CharacterModel>.self) { [weak self] result in
                switch result {
                case .success(let characterResponse):
                    DispatchQueue.main.async {
                        self?.characters = characterResponse.results
                    }
                case .failure(let failure):
                    print(String(describing: failure))
                }
            }
    }
}
