//
//  MainView.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                List {
                    ForEach(viewModel.episodesBySeason, id: \.self) { season in
                        Section {
                            ForEach(season) { episode in
                                EspisodeRow(episode: episode)
                            }
                        } header: {
                            Text("Season " + String(season.first?.season ?? .zero))
                        }
                    }
                    .navigationTitle("The BigBang Episodes")
                    .listRowBackground(Color.purple.opacity(0.5))
                    .listRowSeparatorTint(.black)
                }
            }
            .searchable(text: $viewModel.search, prompt: Text("Search episode"))
        }
    }
}

#Preview {
    MainView.preview
}
