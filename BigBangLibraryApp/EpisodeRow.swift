//
//  EpisodeRow.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import SwiftUI

struct EspisodeRow: View {
    
    let episode: Episode
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(episode.image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(color: .black.opacity(0.5), radius: 5, x: 5, y: 5)
                        .padding(.bottom, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Rate:")
                            .underline()
                            .font(.caption)
                            .padding(.bottom, 8)
                        RatingView(episode: episode)
                            .padding(.bottom, 15)
                        HStack {
                            Spacer()
                            Image(systemName: episode.isFavourite ? "heart.fill" : "heart")
                                .padding(.trailing, 20)
                            Image(systemName: episode.wasSeen ? "eye.fill" : "eye")
                        }
                    }
                    .padding(.leading, 15)
                }
                Text(String(episode.number) + ". " + episode.name)
                    .font(.callout)                
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    EspisodeRow(episode: .test)
}
