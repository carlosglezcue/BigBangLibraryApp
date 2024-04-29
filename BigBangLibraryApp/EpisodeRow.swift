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
                            .foregroundStyle(.primaryText)
                            .padding(.bottom, 8)
                        RatingView(episode: episode)
                            .padding(.bottom, 15)
                        HStack {
                            Spacer()
                            Button { } label: {
                                Image(systemName: episode.isFavourite ? "heart.fill" : "heart")
                                    .foregroundStyle(.red)
                                    .padding(.trailing, 20)
                            }
                            Button { } label: {
                                Image(systemName: episode.wasSeen ? "eye.fill" : "eye")
                                    .foregroundStyle(episode.wasSeen ? .green : .black)
                                    .padding(.trailing, 20)
                            }
                            
                                
                        }
                    }
                    .padding(.leading, 15)
                }
                Text(String(episode.number) + ". " + episode.name)
                    .font(.callout)    
                    .foregroundStyle(.primaryText)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    EspisodeRow(episode: .test)
}
