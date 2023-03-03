//
//  CharacterEpisodeView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 03/03/2023.
//

import SwiftUI

struct CharacterEpisodeView: View {
    @StateObject var viewModel: CharacterEpisodeViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.episode).lineLimit(1)
            Text(viewModel.name).lineLimit(1)
            Text(viewModel.airDate).lineLimit(1)
        }.frame(width: 250, height: 100).border(.red)
    }
}

