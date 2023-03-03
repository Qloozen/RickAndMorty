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
        ZStack (alignment: .topTrailing){
            VStack (spacing: 0){
                KFImage(URL(string: character.image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Text(character.name)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(1)
                    .tint(.primary)
                    .padding(10)
            }
            .background(Color(UIColor.tertiarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(character.status.rawValue)
                .font(.system(size: 14))
                .padding(.horizontal, 5)
                .foregroundColor(.white)
                .background(character.status.tintColor)
                .cornerRadius(5)
                .offset(x: -10, y: 10)

        }
    }
}
