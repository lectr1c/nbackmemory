//
// Created by Abdulrazzaq Summaq on 2022-11-20.
// Copyright (c) 2022 lectr1c. All rights reserved.
//

import Foundation
import SwiftUI

struct InfoView: View {
    @EnvironmentObject var theViewModel: NBackVM

    var body: some View {
        HStack {
            Text(String(format: "Audio Score: %d Incorrect: %d", theViewModel.result.numberRightsAudio, theViewModel.result.numberWrongsAudio))
            Text(String(format: "Visual Score: %d Incorrect: %d", theViewModel.result.numberRightsVisual, theViewModel.result.numberWrongsVisual))
            Text(String(format: "N: %d", theViewModel.result.n))
        }
    }
}