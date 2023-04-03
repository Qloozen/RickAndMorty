//
//  LocationListView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import SwiftUI

struct LocationListView: View {
    @StateObject var viewModel = LocationViewModel()
    
    var body: some View {
        ScrollView {
            ZStack (alignment: .bottomLeading){
                Image("Locations")
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
            LazyVStack {
                ForEach(viewModel.locations, id: \.id) { location in
                    NavigationLink {
                        LocationDetailsView(viewModel: LocationDetailsViewModel(location: location))
                    } label: {
                        RowView(
                            title: location.name,
                            subTitle: location.dimension)
                    }
                }
            }.padding(20)
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
