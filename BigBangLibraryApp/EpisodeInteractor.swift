//
//  EpisodeInteractor.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import Foundation

struct EpisodeInteractor: DataInteractor {
    static let shared = EpisodeInteractor()
    
    var urlDoc: URL {
        URL.documentsDirectory.appending(path: "BigBang.json")
    }
    
    func loadEpisodes() throws -> [Episode] {
        if FileManager.default.fileExists(atPath: urlDoc.path()) {
            let data = try Data(contentsOf: urlDoc)
            return try JSONDecoder().decode([Episode].self, from: data)
        } else {
            guard let url = Bundle.main.url(
                forResource: "BigBang",
                withExtension: "json"
            ) else { return [] }
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([EpisodeDTO].self, from: data).map(\.toPresentation)
                    
        }
    }
    
    func saveEpisode(episode: [Episode]) throws {
        
    }
}
