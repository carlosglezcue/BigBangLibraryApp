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
    @Published var favorited: Bool = false
    @Published var episodeSeen: Bool = false
    @Published var ratingByUser: Double = 0.0
    
    init(episode: Episode) {
        self.episode = episode
        initValues(episode: episode)
    }
    
    func initValues(episode: Episode) {
        notes = episode.notes ?? ""
        favorited = episode.isFavourite
        episodeSeen = episode.wasSeen
        ratingByUser = episode.rating ?? .zero
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
            rating: ratingByUser,
            notes: notes
        )
    }
}

/*
 Cada episodio deberá contar con un detalle. Será navegable desde la
 tabla o desde el Grid de favoritos. Lo que se muestre en el Grid lo
 decide cada persona para su ejercicio.
 La tabla deberá permitir buscar por el nombre del episodio.
 */
