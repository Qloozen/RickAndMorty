//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 22/03/2023.
//

import Foundation

class LocationViewModel: ObservableObject {
    @Published var locations: [LocationModel] = []
    
    private var apiInfo: InfoModel?
    
    init() {
        fetchLocations()
    }
    
    private func fetchLocations() {
        let url = "\(APIService.baseUrl)\(APIEndpoint.location)"
        APIService.shared.execute(url: url, expecting: GenericResponseModel<LocationModel>.self) { result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.locations = model.results
                    self.apiInfo = model.info
                }
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
}
