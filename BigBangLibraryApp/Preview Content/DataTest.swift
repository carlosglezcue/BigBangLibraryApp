//
//  DataTest.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import Foundation

extension EpisodeDTO {
    var toPresentationTest: Episode {
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
            isFavourite: Bool.random(),
            wasSeen: Bool.random(),
            rating: Double.random(in: 0...5),
            notes: ""
        )
    }
}

struct EpisodeInteractorTest: DataInteractor {
    func loadEpisodes() throws -> [Episode] {
        guard let url = Bundle.main.url(
            forResource: "BigBangTest",
            withExtension: "json"
        ) else { return [] }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([EpisodeDTO].self, from: data).map(\.toPresentationTest)
    }
    
    func saveEpisode(episode: [Episode]) throws {
    }
}
