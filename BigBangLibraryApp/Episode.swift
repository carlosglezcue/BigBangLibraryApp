//
//  Episode.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import Foundation

struct Episode: Codable, Identifiable, Hashable {
    let id: Int
    let url: URL
    let name: String
    let season, number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
    let isFavourite: Bool
    let wasSeen: Bool
    let rating: Double?
    let notes: String?
}
