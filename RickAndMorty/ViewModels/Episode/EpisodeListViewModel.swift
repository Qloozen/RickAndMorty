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
    @Published var selectedSeason: Int = 0 {
        didSet {
            sortOnSeason()
        }
    }
    
    private var apiInfo: InfoModel?
    private var seasonSet = Set<Int>([0])

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
                    DispatchQueue.main.async {
                        self.apiInfo = model.info
                        self.episodes = model.results
                        self.filteredEpisodes = model.results
                        self.getSeasons(episodes: model.results)
                    }
                case .failure(let failure):
                    print(String(describing: failure))
                }
            }
    }
    
    private func getSeasons(episodes: [EpisodeModel]) {
        for episode in episodes {
            let parts = episode.episode.components(separatedBy: CharacterSet(charactersIn: "SE"))
            guard let num = Int(parts[1]) else {
                continue
            }
            self.seasonSet.insert(num)
        }
        self.seasons = Array(self.seasonSet).sorted()
    }
    
    public func fetchAdditionalEpisodes() {
        guard let nextUrl = self.apiInfo?.next else {
            return
        }
        
        APIService.shared.execute(url: nextUrl, expecting: GenericResponseModel<EpisodeModel>.self) { result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.apiInfo = model.info
                    self.episodes += model.results
                    self.getSeasons(episodes: model.results)
                    self.sortOnSeason()
                }
            case .failure(let failure):
                print(String(describing: failure))

            }
        }
        
        
    }
    
    public func sortOnSeason() {
        DispatchQueue.main.async {
            if self.selectedSeason == 0 {
                self.filteredEpisodes = self.episodes
                return
            }
            self.filteredEpisodes = self.episodes.filter { episode in
                let parts = episode.episode.components(separatedBy: CharacterSet(charactersIn: "SE"))
                return self.selectedSeason == Int(parts[1])
            }
        }
    }
}
