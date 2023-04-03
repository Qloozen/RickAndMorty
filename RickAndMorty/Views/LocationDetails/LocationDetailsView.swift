//
//  LocationDetailsView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 03/04/2023.
//

import SwiftUI

struct LocationDetailsView: View {
    @StateObject var viewModel: LocationDetailsViewModel
    
    private let gridItems: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.displayName).font(.largeTitle)
                Text(viewModel.displayType)
                Text(viewModel.displayDimension)
                Text("Redidents")
                
                LazyVGrid(columns: gridItems) {
                    ForEach(viewModel.residents, id: \.id) { character in
                        NavigationLink {
                            CharacterDetailView(viewModel: CharacterDetailViewModel(character))
                        } label: {
                            CharacterListCellView(character: character)
                        }
                    }
                }
            }
        }

        .padding(20)
    }
}

