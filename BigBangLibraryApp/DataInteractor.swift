//
//  DataInteractor.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import Foundation

protocol DataInteractor {
    func loadEpisodes() throws -> [Episode]
    func saveEpisode(episodes: [Episode]) throws
}
