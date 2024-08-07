//
//  FavoritedListView.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 25/5/24.
//

import SwiftUI

struct FavoritedListView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    
    let fixedItems: [GridItem] = [GridItem(.fixed(200)), GridItem(.fixed(200))]
    
    var body: some View {
        NavigationStack {
            Group {
                ScrollView {
                    LazyVGrid(columns: fixedItems) {
                        ForEach(viewModel.episodes) { episode in
                            if episode.isFavourite {
                                NavigationLink(value: episode) {
                                    FavouriteEpisodeRow(episode: episode)
                                        .padding(.horizontal)
                                   
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .scrollBounceBehavior(.basedOnSize)
                    .navigationTitle("The BigBang Episodes")
                }
                
            }
            .searchable(text: $viewModel.search, prompt: Text("Search episode"))
            .navigationDestination(for: Episode.self) { episode in
                DetailView(detailViewModel: DetailViewModel(episode: episode))
            }
            .background(.principal.opacity(0.5))
        }
    }
}

#Preview {
    FavoritedListView.preview
}
