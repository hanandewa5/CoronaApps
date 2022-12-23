//
//  ContentView.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 23/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("Menu", systemImage: "house")
                }
            
            SearchView()
                .tabItem {
                    Label("Search Hospital", systemImage: "magnifyingglass")
                }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
