//
//  DetailView.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 2/5/24.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var viewModel: MainViewModel
    @ObservedObject var detailViewModel: DetailViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.principal.opacity(0.5))
                .ignoresSafeArea()
            
            VStack {
                
            }
        }
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
}

#Preview {
    DetailView.preview
}
