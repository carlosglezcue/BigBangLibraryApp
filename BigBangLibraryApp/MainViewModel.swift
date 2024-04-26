//
//  MainViewModel.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    private let interactor: DataInteractor
    
    @Published var episodes: [Episode]
    @Published var search = ""
    
    var episodesBySeason: [[Episode]] {
        let searchFilter = episodes.filter { episode in
            if search.isEmpty {
                true
            } else {
                episode.name.localizedStandardContains(search)
            }
        }
        .sorted { first, second in
            first.number < second.number
        }
        return Dictionary(grouping: searchFilter) { episode in
            episode.season
        }
        .values.sorted { first, second in
            first.first?.season ?? .zero < second.first?.season ?? .zero
        }
    }
    
    init(interactor: DataInteractor = EpisodeInteractor.shared) {
        self.interactor = interactor
        do {
            episodes = try interactor.loadEpisodes()
        } catch {
            episodes = []
            print(error)
        }
    }
    
    func saveEpisode() {
        do {
            try interactor.saveEpisode(episode: episodes)
        } catch {
            print("Error al guardar: \(error)")
        }
    }
}
