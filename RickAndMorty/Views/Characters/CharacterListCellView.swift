//
//  CharacterListCellView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 01/03/2023.
//

import SwiftUI
import Kingfisher

struct CharacterListCellView: View {
    
    let character: CharacterModel
    
    var body: some View {
        VStack {
            KFImage(URL(string: character.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack {
                Text(character.name)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(1)
                Text(character.status.rawValue)
                    .font(.system(size: 14, weight: .light))
            }.padding(5)
        }
        .background(Color(UIColor.tertiarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
