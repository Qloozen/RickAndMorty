//
//  CharacterEpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 03/03/2023.
//

import Foundation



final class CharacterEpisodeViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var episode: String = ""
    @Published var airDate: String = ""
    
    init(episodeUrl: String) {
        self.fetchEpisode(episodeUrl)
    }
    
    private func fetchEpisode(_ episodeUrl: String) {
        APIService.shared.execute(
            url: episodeUrl,
            expecting: EpisodeModel.self) { result in
                switch result {
                case .success(let model):
                    DispatchQueue.main.async {
                        let parts = model.episode.components(separatedBy: CharacterSet(charactersIn: "SE"))
                        self.name = model.name
                        self.episode = "Season \(parts[1]), Episode \(parts[2])"
                        self.airDate = "Aired on \(model.air_date)"
                    }
                case .failure(let failure):
                    print(String(describing: failure))
                }
            }
    }
}
