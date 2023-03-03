//
//  CharacterInfoCardViewViewModel.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 02/03/2023.
//

import Foundation
import SwiftUI

final class CharacterInfoCardViewModel: ObservableObject {
    @Published var type: CharacterInfoType
    @Published var displayType: String
    @Published var value: String

    init(_ type: CharacterInfoType, _ value: String) {
        self.type = type
        self.displayType = type.rawValue.uppercased()
        guard !value.isEmpty else {
            self.value = "None"
            return
        }

        if type == .created {
            self.value = DateHelper.formatDate(value) ?? ""
            return
        }
        
        self.value = value
    }
    
    enum CharacterInfoType: String {
        case status, gender, type, species, origin, created, location
        case episodeCount = "episode count"
        
        var tintColor: Color {
            switch self {
            case .status:
                return .green
            case .gender:
                return .blue
            case .type:
                return .pink
            case .species:
                return .purple
            case .origin:
                return .red
            case .created:
                return .orange
            case .location:
                return .yellow
            case .episodeCount:
                return .mint
            }
        }
    }
}
