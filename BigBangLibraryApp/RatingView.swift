//
//  RatingView.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import SwiftUI

struct RatingView: View {
    
    let episode: Episode
    
    var body: some View {
            HStack {
                if let rating = episode.rating {
                    switch rating {
                        case 0...1:
                            Image(systemName: "star.fill")
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                        case 1...2:
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                        case 2...3:
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star")
                            Image(systemName: "star")
                        case 3...4:
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star")
                        case 4...5:
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                        default:
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                    }
                }
            }
            .foregroundStyle(.yellow)
    }
}

#Preview {
    RatingView(episode: .test)
}
