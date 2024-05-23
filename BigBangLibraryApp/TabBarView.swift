//
//  TabBarView.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 23/5/24.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        
        TabView {
            MainView()
                .tabItem {
                    Label("Episodes", systemImage: "list.bullet.clipboard.fill")
                }
            FavoritedListView()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
