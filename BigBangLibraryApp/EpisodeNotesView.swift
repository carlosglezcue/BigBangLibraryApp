//
//  EpisodeNotesView.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 23/5/24.
//

import SwiftUI

struct EpisodeNotesView: View {
    
    @Binding var notes: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Add episode note:")
                .font(.caption)
                .foregroundStyle(.primaryText)
                .padding(.leading, 8)
            
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 8.0)
                    .frame(height: 150)
                    .foregroundStyle(.white)
                    .shadow(radius: 6)
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $notes)
                        .font(.callout)
                        .frame(height: 120)
                        .padding()
                    
                    if notes.isEmpty {
                        Text("Enter your text here...")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding(.top, 25)
                            .padding(.leading, 22)
                    }
                }
            }
            .padding(.top, 10)
        }
    }
}
#Preview {
    EpisodeNotesView(notes: .constant(""))
}
