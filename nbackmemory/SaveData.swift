//
// Created by Abdulrazzaq Summaq on 2022-11-19.
// Copyright (c) 2022 lectr1c. All rights reserved.
//

import Foundation

struct SaveData: Codable {
    var settings: SettingsModel
    var results: [ResultModel]
}