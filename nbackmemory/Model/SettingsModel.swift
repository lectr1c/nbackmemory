//
// Created by Abdulrazzaq Summaq on 2022-11-18.
// Copyright (c) 2022 lectr1c. All rights reserved.
//

import Foundation

struct SettingsModel: Codable {
    var n: Int
    var visual: Bool
    var audio: Bool
    var delay: Double
    var numberOfRounds: Int
}