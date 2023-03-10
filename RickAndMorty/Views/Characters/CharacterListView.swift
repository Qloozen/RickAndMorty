//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel = CharacterListViewModel()
    
    private let gridItems: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems) {
                ForEach(viewModel.characters, id: \.id) { character in
                    NavigationLink {
                        CharacterDetailView(viewModel: CharacterDetailViewModel(character))
                    } label: {
                        CharacterListCellView(character: character)
                    }
                }
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
