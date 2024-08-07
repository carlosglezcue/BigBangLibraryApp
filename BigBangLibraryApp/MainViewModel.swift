//
//  MainViewModel.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    private let interactor: DataInteractor
    
    @Published var episodes: [Episode] {
        didSet {
            saveEpisode()
        }
    }
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
            self.episodes = try interactor.loadEpisodes()
        } catch {
            self.episodes = []
            print(error)
        }
    }
    
    func saveEpisode() {
        do {
            try interactor.saveEpisode(episodes: episodes)
        } catch {
            print("Error al guardar: \(error)")
        }
    }
    
    func updateEpisode(episode: Episode) {
        if let index = episodes.firstIndex(where: { $0.id == episode.id }) {
            episodes[index] = episode
        }
    }
}
