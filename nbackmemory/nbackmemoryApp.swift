//
//  nbackmemoryApp.swift
//  nbackmemory
//
//  Created by Abdulrazzaq Summaq on 2022-11-09.
//
//

import SwiftUI

@main
struct nbackmemoryApp: App {
    @StateObject private var theViewModel = NBackVM()


    var body: some Scene {
        WindowGroup {
            ContentView()
                    .environmentObject(theViewModel)
                    .preferredColorScheme(.light);
        }
    }
}