//
//  FavouriteEpisodeRow.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 25/5/24.
//

import SwiftUI

struct FavouriteEpisodeRow: View {
    
    let episode: Episode
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(episode.image)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Rectangle()
                .foregroundStyle(.white.opacity(0.9))
                .frame(height: 40)
            
            HStack {
                Text(String(episode.number) + ". " + episode.name)
                    .font(.callout)
                    .foregroundStyle(.primaryText)
                
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                
            }
            .padding([.horizontal, .bottom], 10)
        }
    }
}

#Preview {
    FavouriteEpisodeRow(episode: .test)
}
