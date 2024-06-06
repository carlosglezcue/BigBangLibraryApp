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
        VStack {
            ZStack(alignment: .bottomLeading) {
                Image(episode.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(color: .black.opacity(0.5), radius: 5, x: 5, y: 5)
                
                RoundedRectangle(cornerRadius: 8.0)
                    .foregroundStyle(.white.opacity(0.65))
                    .frame(width: 20, height: 20)
                
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(.yellow)
                    .padding([.leading, .bottom], 5)
            }
            .padding(.bottom)
            
            Text("Season \(episode.season) - Episode: \(episode.number)")
                .font(.caption)
                .bold()
                .foregroundStyle(.primaryText)
                .padding(.bottom, 5)
            
            Divider()
                .frame(height: 2)
                .foregroundStyle(.principal)
        }
    }
}

#Preview {
    FavouriteEpisodeRow(episode: .test)
}
