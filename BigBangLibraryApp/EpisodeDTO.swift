//
//  EpisodeDTO.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import Foundation

struct EpisodeDTO: Codable {
    let id: Int
    let url: URL
    let name: String
    let season: Int
    let number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
}

extension EpisodeDTO {
    var toPresentation: Episode {
        Episode(
            id: id,
            url: url,
            name: name,
            season: season,
            number: number,
            airdate: airdate,
            runtime: runtime,
            image: image,
            summary: summary,
            isFavourite: false,
            wasSeen: false,
            rating: Double.random(in: 0...5),
            notes: ""
        )
    }
}
