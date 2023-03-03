//
//  EpisodeListCellView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 03/03/2023.
//

import SwiftUI

struct EpisodeListCellView: View {
    let episode: EpisodeModel;
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(episode.name).font(.system(
                    size: 18,
                    weight: .bold)
                )
                Text("\(episode.episode), \(episode.air_date)").font(.system(
                    size: 14,
                    weight: .regular)
                )
            }
            .padding(15)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.green)
                .padding(20)
        }
        .background(Color(UIColor.secondarySystemBackground))
        .frame(maxWidth: .infinity)
        .cornerRadius(5)
    }
}
