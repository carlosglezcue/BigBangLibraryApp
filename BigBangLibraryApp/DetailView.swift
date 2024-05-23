//
//  DetailView.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 2/5/24.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var mainViewModel: MainViewModel
    @ObservedObject var detailViewModel: DetailViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.principal.opacity(0.5))
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    Image(detailViewModel.episode.image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Summary:")
                            .underline()
                            .font(.callout)
                            .foregroundStyle(.primaryText)
                            .bold()
                        
                        Text(detailViewModel.episode.summary)
                            .font(.callout)
                            .foregroundStyle(.primaryText)
                    }
                    
                    HStack {
                        Text("Date:")
                            .underline()
                            .font(.caption)
                            .foregroundStyle(.primaryText)
                            .bold()
                        
                        Text(detailViewModel.episode.airdate)
                            .font(.caption)
                            .foregroundStyle(.primaryText)
                        
                        Spacer()
                        
                        Button {
                            detailViewModel.episodeSeen.toggle()
                        } label: {
                            Image(systemName: detailViewModel.episodeSeen ? "eye.fill" : "eye")
                                .foregroundStyle(detailViewModel.episodeSeen ? .green : .black)
                                .padding(.trailing, 30)
                        }
                        
                        Button {
                            detailViewModel.favorited.toggle()
                        } label: {
                            Image(systemName: detailViewModel.favorited ? "heart.fill" : "heart")
                                .foregroundStyle(detailViewModel.favorited ? .red : .black)
                        }
                    }
                    .padding(.bottom)
                    
                    
                    RatingView(ratingByUser: $detailViewModel.ratingByUser)
                        .padding(.bottom)
                    
                    EpisodeNotesView(notes: $detailViewModel.notes)
                        .padding(.bottom)
                }
                .padding()
            }
            .navigationTitle("\(detailViewModel.episode.number). " + detailViewModel.episode.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        if let updated = detailViewModel.updatedScore() {
                            mainViewModel.updateEpisode(episode: updated)
                        }
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward.circle.fill")
                            .foregroundStyle(Material.bar)
                            .shadow(color: .gray.opacity(0.25), radius: 5, y: 5)
                    }
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    DetailView.preview
}
