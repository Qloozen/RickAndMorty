//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Qiang Loozen on 28/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                CharacterListView().navigationTitle("Characters")
            }.tabItem {
                Label("Characters", systemImage: "person")
            }
            NavigationStack {
                EpisodeListView().navigationTitle("Episodes")
            }
            .tabItem {
                Label("Episodes", systemImage: "play.tv")
            }
            
            NavigationStack {
                LocationListView().navigationTitle("Locations")
            }
            .tabItem {
                Label("Locations", systemImage: "globe")
            }
            
            NavigationStack {
                SettingsView().navigationTitle("Settings")
            }
            .tabItem {
                Label("Setting", systemImage: "gear")
            }
        }
        .onAppear {
            // Fix to always show the tabbar background
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
