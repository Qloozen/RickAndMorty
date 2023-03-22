//
//  EpisodeDetailViewModel.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 03/03/2023.
//

import Foundation

final class EpisodeDetailViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var airDate: String = ""
    @Published var episode: String = ""
    @Published var characters: [CharacterModel] = []
    
    private var characterUrls: [String] = [] {
        didSet {
            self.fetchCharacters()
        }
    }
    
    init(url: String) {
        self.fetchEpisode(url: url)
    }
    
    private func fetchEpisode(url: String) {
        APIService.shared.execute(url: url, expecting: EpisodeModel.self) { result in
            switch result {
            case .success(let episode):
                DispatchQueue.main.async {
                    self.name = episode.name
                    self.airDate = episode.air_date
                    self.episode = episode.episode
                    self.characterUrls = episode.characters
                }
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
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
                        self.characters.append(character)
                    }
                case .failure:
                    break
                }
            }
        }
    }
}
