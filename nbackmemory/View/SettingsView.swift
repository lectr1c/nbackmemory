//
// Created by Abdulrazzaq Summaq on 2022-11-10.
//

import SwiftUI
import Combine

struct SettingsView: View {
    @EnvironmentObject var viewModel: NBackVM


    var body: some View {
        List {
            Picker("N-Value", selection: $viewModel.settings.n) {
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
            }.onChange(of: viewModel.settings.n){ newValue in
                        viewModel.saveState()
                    }
            Toggle(isOn: $viewModel.settings.audio) { Text("Audio"); }.onChange(of: viewModel.settings.audio) { newVal in viewModel.saveState()}
            Toggle(isOn: $viewModel.settings.visual) { Text("Visual"); }.onChange(of: viewModel.settings.visual) { newVal in viewModel.saveState()}
            Stepper(value: $viewModel.settings.delay, in: 2...5, step: 0.1) {
                Text("Delay:  " + String(format: "%0.1f seconds", viewModel.settings.delay));
            }.onChange(of: viewModel.settings.delay){ newValue in
                        viewModel.saveState()
                    }
            Stepper(value: $viewModel.settings.numberOfRounds, in: 5...50, step: 1) {
                Text("Rounds:  " + String(format: "%d", viewModel.settings.numberOfRounds));
            }.onChange(of: viewModel.settings.numberOfRounds){ newValue in
                        viewModel.saveState()
                    }
        }
    }
}