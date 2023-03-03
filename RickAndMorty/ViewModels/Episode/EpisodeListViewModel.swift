//
//  EpisodeListViewModel.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 03/03/2023.
//

import Foundation

final class EpisodeListViewModel: ObservableObject {
    
    @Published var episodes: [EpisodeModel] = []
    @Published var filteredEpisodes: [EpisodeModel] = []
    @Published var seasons: [Int] = []

    
    init() {
        self.fetchEpisodes()
    }
    
    private func fetchEpisodes() {
        let url = "\(APIService.baseUrl)\(APIEndpoint.episode)"
        
        APIService.shared.execute(
            url: url,
            expecting: GenericResponseModel<EpisodeModel>.self) { result in
                switch result {
                case .success(let model):
                    var seasonSet = Set<Int>([0])
                    
                    for episode in model.results {
                        let parts = episode.episode.components(separatedBy: CharacterSet(charactersIn: "SE"))
                        guard let num = Int(parts[1]) else {
                            continue
                        }
                        seasonSet.insert(num)
                    }
                    
                    DispatchQueue.main.async {
                        self.episodes = model.results
                        self.filteredEpisodes = model.results
                        self.seasons = Array(seasonSet).sorted()
                    }
                case .failure(let failure):
                    print(String(describing: failure))
                }
        }
    }
    
    public func sortOnSeason(_ season: Int) {
        DispatchQueue.main.async {
            if season == 0 {
                self.filteredEpisodes = self.episodes
                return
            }
            self.filteredEpisodes = self.episodes.filter { episode in
                let parts = episode.episode.components(separatedBy: CharacterSet(charactersIn: "SE"))
                return season == Int(parts[1])
            }
        }
    }
}
