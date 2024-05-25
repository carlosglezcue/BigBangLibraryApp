//
//  FavoritedListView.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 25/5/24.
//

import SwiftUI

struct FavoritedListView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    
    let fixedItems: [GridItem] = [GridItem(.fixed(200))]
    
    var body: some View {
        NavigationStack {
            Group {
                ScrollView {
                    ForEach(viewModel.episodesBySeason, id: \.self) { season in
                        Section {
                            ScrollView(.horizontal) {
                                LazyHGrid(rows: fixedItems, spacing: 10) {
                                    ForEach(season) { episode in
                                        if episode.isFavourite {
                                            NavigationLink(value: episode) {
                                                FavouriteEpisodeRow(episode: episode)
                                                    .padding(.horizontal)
                                            }
                                        }
                                    }
                                }
                            }
                            .scrollIndicators(.hidden)
                            .scrollBounceBehavior(.basedOnSize)
                        } header: {
                            Text("Season " + String(season.first?.season ?? .zero))
                                .underline()
                                .font(.title3)
                                .bold()
                                .padding(.top)
                        }
                    }
                    .navigationTitle("The BigBang Episodes")
                }
            }
            .searchable(text: $viewModel.search, prompt: Text("Search episode"))
            .navigationDestination(for: Episode.self) { episode in
                DetailView(detailViewModel: DetailViewModel(episode: episode))
            }
        }
    }
}

#Preview {
    FavoritedListView.preview
}
