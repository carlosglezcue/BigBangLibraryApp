//
//  DetailViewModel.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 2/5/24.
//

import SwiftUI

final class DetailViewModel: ObservableObject {
    let episode: Episode
    
    @Published var notes: String = ""
    @Published var favorited = false
    @Published var episodeSeen = false
    
    init(episode: Episode) {
        self.episode = episode
        initValues(episode: episode)
    }
    
    func initValues(episode: Episode) {
        notes = episode.notes ?? ""
        favorited = episode.isFavourite
        episodeSeen = episode.wasSeen
    }
    
    func updatedScore() -> Episode? {
        return Episode(
            id: episode.id,
            url: episode.url,
            name: episode.name,
            season: episode.season,
            number: episode.number,
            airdate: episode.airdate,
            runtime: episode.runtime,
            image: episode.image,
            summary: episode.summary,
            isFavourite: favorited,
            wasSeen: episodeSeen,
            rating: episode.rating,
            notes: notes
        )
    }
}
