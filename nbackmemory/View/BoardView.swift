//
// Created by Abdulrazzaq Summaq on 2022-11-20.
// Copyright (c) 2022 lectr1c. All rights reserved.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var viewModel : NBackVM

    var body: some View {
        ZStack{
            BackgroundView(width: 300, height: 300)

            ForEach(viewModel.markers) { aMarker in
                Marker(marker: aMarker.state, id: aMarker.id )
                        .position(x: CGFloat(50 + aMarker.x * 100), y: CGFloat(50 + aMarker.y * 100))
            }
        }
                .frame(width: 300, height: 300, alignment: .center)
    }
}