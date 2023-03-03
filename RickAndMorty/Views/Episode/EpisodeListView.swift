//
//  EpisodeListView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import SwiftUI

struct EpisodeListView: View {
    @StateObject var viewModel = EpisodeListViewModel()
    @State private var selection: Int = 0;
    
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
                            gradient: Gradient(colors: [.clear, Color(UIColor.systemBackground)]),
                            startPoint: .top,
                            endPoint: .bottom)
                        )
                }
                HStack{
                    Picker("Select a season", selection: $selection) {
                        ForEach(viewModel.seasons, id: \.self) {
                            Text($0 == 0 ? "All" : " Season \($0)")
                        }
                    }
                    .onChange(of: selection, perform: { _ in
                        viewModel.sortOnSeason(selection)
                    })
                    .pickerStyle(.menu)
                    .tint(Color.primary)
                    .background(Color(UIColor.secondarySystemBackground))
                    .border(Color(UIColor.tertiarySystemBackground))
                    .cornerRadius(5)
                    
                    Spacer()
                    
                    Text("Showing: \(viewModel.filteredEpisodes.count)")
                }
                .padding(20)
                
                ForEach(viewModel.filteredEpisodes, id: \.id) { episode in
                    EpisodeListCellView(episode: episode)
                }
                .padding(.horizontal, 20)

            }

        }
    }
}

//struct EpisodeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeListView()
//    }
//}
