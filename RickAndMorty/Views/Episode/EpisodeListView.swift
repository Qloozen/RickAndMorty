//
//  EpisodeListView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import SwiftUI

struct EpisodeListView: View {
    @State private var selection = "Season 1"
    @StateObject var viewModel = EpisodeListViewModel()

    let colors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                ZStack (alignment: .bottomLeading){
                    Image("Wallpaper")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight: 250)
                        .clipped()
                        .opacity(0.75)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 150)
                        .background(LinearGradient(
                            gradient: Gradient(colors: [.clear, .black]),
                            startPoint: .top,
                            endPoint: .bottom)
                        )
                }
                    
                Picker("Select a season", selection: $selection) {
                    ForEach(["season 1", "season 2", "season 3"], id: \.self) {
                        Text($0)
                    }
                }
                .border(.red)
                .pickerStyle(.menu)
                
                ForEach(viewModel.episodes, id: \.id) { episode in
                    EpisodeListCellView(episode: episode)
                }
            }
        }
    }
}

//struct EpisodeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeListView()
//    }
//}
