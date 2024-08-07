//
//  RatingView.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var ratingByUser: Double
    
    var body: some View {
        HStack {
            Button {
                ratingByUser = 1.0
            } label: {
                Image(systemName: ratingByUser >= 1.0 ? "star.fill" : "star")
            }
            
            Button {
                ratingByUser = 2.0
            } label: {
                Image(systemName: ratingByUser >= 2.0 ? "star.fill" : "star")
            }
            
            Button {
                ratingByUser = 3.0
            } label: {
                Image(systemName: ratingByUser >= 3.0 ? "star.fill" : "star")
            }
            
            Button {
                ratingByUser = 4.0
            } label: {
                Image(systemName: ratingByUser >= 4.0 ? "star.fill" : "star")
            }
            
            Button {
                ratingByUser = 5.0
            } label: {
                Image(systemName: ratingByUser == 5.0 ? "star.fill" : "star")
            }
        }
        .foregroundStyle(.yellow)
    }
}

#Preview {
    RatingView(ratingByUser: .constant(0.0))
}
