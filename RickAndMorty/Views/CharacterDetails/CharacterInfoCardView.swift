//
//  CharacterInfoCardView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 02/03/2023.
//

import SwiftUI

struct CharacterInfoCardView: View {
    @StateObject var viewModel: CharacterInfoCardViewViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.displayType)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(viewModel.type.tintColor)
                .font(.system(size: 20, weight: .bold))
                .background(Color(UIColor.secondarySystemBackground))
                .lineLimit(1)

            Text(viewModel.value)
                .padding(5)
                .frame(height: 75)
                .font(.system(size: 20))
                .background(Color(UIColor.tertiarySystemBackground))
                .multilineTextAlignment(.leading)
        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.tertiarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

//struct CharacterInfoCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterInfoCardView()
//    }
//}
