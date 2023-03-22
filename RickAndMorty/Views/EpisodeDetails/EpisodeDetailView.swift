//
//  EpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 03/03/2023.
//

import SwiftUI
import Kingfisher

struct EpisodeDetailView: View {
    @StateObject var viewModel: EpisodeDetailViewModel
    
    var body: some View {
        VStack (spacing: 20) {
            VStack {
                Text("\(viewModel.episode) - \(viewModel.name)")
                    .font(.system(size: 24, weight: .bold))
                Text("\(viewModel.airDate)")
                    .font(.footnote)
            }
            
            Text("Characters in episode:")

            ScrollView(.horizontal) {
                LazyHStack (spacing: 20){
                    ForEach(viewModel.characters, id: \.id) { character in
                        NavigationLink {
                            CharacterDetailView(viewModel: .init(character))
                        } label: {
                            GeometryReader() { geometry in
                                VStack {
                                    KFImage(URL(string: character.image))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 200, height: 250)
                                        .clipped()
                                        .cornerRadius(10)
                                        .rotation3DEffect(Angle(degrees:( Double(geometry.frame(in: .global).minX - 40 ) / -20)),
                                                          axis: (x: 0, y: 10, z: 0))
                                        .shadow(color: Color(UIColor.tertiarySystemBackground), radius: 5, x: 20, y: 20)
                                    Text("\(character.name)")
                                        .foregroundColor(.primary)
                                        .fontWeight(.bold)
                                }
                            }.frame(width: 200, height: 250)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 350)
            }
            
            Spacer()
        }
    }
}

