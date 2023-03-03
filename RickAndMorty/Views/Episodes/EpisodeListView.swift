//
//  EpisodeListView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import SwiftUI

struct EpisodeListView: View {
    @State private var selection = "Season 1"

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
                
                ForEach(0...10, id: \.self) { _ in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Episode name")
                            Text("S01E01, 30 dec 2022")
                        }
                        .padding(10)
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
        }
    }
}

//struct EpisodeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeListView()
//    }
//}
