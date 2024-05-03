//
//  DetailViewModel.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 2/5/24.
//

import SwiftUI

final class DetailViewModel: ObservableObject {
    let episode: Episode
    
    @Published var note: String = ""
    
    init(episode: Episode) {
        self.episode = episode
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
            isFavourite: episode.isFavourite,
            wasSeen: episode.wasSeen,
            rating: episode.rating,
            notes: note
        )
    }
}
