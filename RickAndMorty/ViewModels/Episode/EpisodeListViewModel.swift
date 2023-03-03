//
//  EpisodeListViewModel.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 03/03/2023.
//

import Foundation

final class EpisodeListViewModel: ObservableObject {
    
    @Published var episodes: [EpisodeModel] = []
    
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
                        self.episodes = model.results
                    }
                case .failure(let failure):
                    print(String(describing: failure))
                }
        }
    }
}
