//
//  DetailViewModel.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 2/5/24.
//

import SwiftUI

final class DetailViewModel: ObservableObject {
    let episode: Episode
    
    init(episode: Episode) {
        self.episode = episode
    }
}
