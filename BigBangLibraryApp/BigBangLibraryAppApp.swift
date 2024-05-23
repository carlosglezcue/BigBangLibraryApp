//
//  BigBangLibraryAppApp.swift
//  BigBangLibraryApp
//
//  Created by carlos.gonzalez.local on 26/4/24.
//

import SwiftUI

@main
struct BigBangLibraryAppApp: App {
    
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(mainViewModel)
        }
    }
}
