//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 01/03/2023.
//

import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    @StateObject var viewModel: CharacterDetailViewModel
    
    private let gridItems: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
    ]
    
    var body: some View {
        ScrollView{
            VStack(spacing: 30) {
                KFImage(URL(string: viewModel.character.image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .cornerRadius(10)

                Text(viewModel.character.name)
                    .font(.system(size: 24, weight: .bold))

                LazyVGrid(
                    columns: gridItems,
                    spacing: 10
                ) {
                    ForEach(viewModel.characterInfoCardViewModels, id: \.type) { model in
                        CharacterInfoCardView(viewModel: model)
                            .navigationTitle(viewModel.character.name)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
                ScrollView (.horizontal){
                    LazyHGrid(
                        rows: [gridItems[0]],
                        spacing: 10
                    ) {
                        ForEach(viewModel.character.episode, id: \.self) { episodeUrl in
                            CharacterEpisodeView(viewModel: .init(episodeUrl: episodeUrl))
                        }
                    }
                }
            }
        }

    }
}
