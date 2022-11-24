//
//  ContentView.swift
//  nbackmemory
//
//  Created by Abdulrazzaq Summaq on 2022-11-09.
//
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var theViewModel : NBackVM
    var body: some View {
        TabView {
            GameView(width: 300, height: 300)
                    .tabItem {
                        Label("Main", systemImage: "grid.circle.fill")
                    }
            SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear.circle")
                    }.disabled(theViewModel.theModel.gameIsActive)
            HistoryView()
                    .tabItem {
                        Label("History", systemImage: "wallet.pass.fill")
                    }.disabled(theViewModel.theModel.gameIsActive)
        }.onAppear(perform: {
                    theViewModel.loadState()
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
