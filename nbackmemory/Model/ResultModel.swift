//
// Created by Abdulrazzaq Summaq on 2022-11-19.
// Copyright (c) 2022 lectr1c. All rights reserved.
//

import Foundation

struct ResultModel: Codable, Hashable {
    var numberWrongsVisual: Int
    var numberRightsVisual: Int

    var numberWrongsAudio: Int
    var numberRightsAudio: Int

    var totalRounds: Int
    var n: Int

    var delay: Double

    init(n: Int, delay: Double) {
        self.n = n
        numberRightsAudio = 0
        numberRightsVisual = 0
        numberWrongsAudio = 0
        numberWrongsVisual = 0
        totalRounds = 0
        self.delay = delay
    }
}