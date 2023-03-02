//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 01/03/2023.
//

import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    @StateObject var viewModel: CharacterDetailViewViewModel
    
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
                    ForEach(viewModel.characterInfoCardViewViewModels, id: \.type) { model in
                        CharacterInfoCardView(viewModel: model)
                            .navigationTitle(viewModel.character.name)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
        }
        
    }
}
