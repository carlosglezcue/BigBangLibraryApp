//
//  DetailView.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 2/5/24.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var note: String = ""
    
    let episode: Episode
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.principal.opacity(0.5))
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    Image(episode.image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Summary:")
                            .underline()
                            .font(.callout)
                            .foregroundStyle(.primaryText)
                            .bold()
                        
                        Text(episode.summary)
                            .font(.callout)
                            .foregroundStyle(.primaryText)
                    }
                    
                    HStack {
                        Text("Date:")
                            .underline()
                            .font(.caption)
                            .foregroundStyle(.primaryText)
                            .bold()
                        
                        Text(episode.airdate)
                            .font(.caption)
                            .foregroundStyle(.primaryText)
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(String(episode.rating?.binade ?? .zero))
                            .font(.caption)
                            .foregroundStyle(.primaryText)
                        
                        Spacer()
                        
                        Image(systemName: episode.isFavourite ? "heart.fill" : "heart")
                            .foregroundStyle(episode.isFavourite ? .red : .black)
                        
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Add episode note:")
                            .font(.caption)
                            .foregroundStyle(.primaryText)
                            .padding(.leading, 8)
                        
                        TextField("Episode Notes", text: $note)
                            .font(.callout)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding(.bottom, 20)
                }
                .padding()
            }
            .navigationTitle("\(episode.number). " + episode.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
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
    DetailView(episode: .test)
}
