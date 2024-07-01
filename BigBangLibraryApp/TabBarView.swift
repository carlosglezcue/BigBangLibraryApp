//
//  TabBarView.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 23/5/24.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack {
            if isActive {
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
            } else {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
            }
            
        }
    }
}

#Preview {
    TabBarView()
}
