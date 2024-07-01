//
//  SplashScreen.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 1/7/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Image(.bigBangIcon)
                .resizable()
                .frame(width: 400, height: 300)
        }
    }
}

#Preview {
    SplashScreen()
}
