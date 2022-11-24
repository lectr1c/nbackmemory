//
// Created by Abdulrazzaq Summaq on 2022-11-20.
// Copyright (c) 2022 lectr1c. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {

    let width : CGFloat
    let height : CGFloat

    var body: some View {


        ZStack {
            Rectangle()
                    .fill(Color(.black))
                    .cornerRadius(20)
                    .frame(width: 10, height: height, alignment: .center)
                    .position(x: width / 3, y: height / 2)

            Rectangle()
                    .fill(Color(.black))
                    .cornerRadius(20)
                    .frame(width: 10, height: height, alignment: .center)
                    .position(x: width * 2 / 3, y: height / 2)

            Rectangle()
                    .fill(Color(.black))
                    .cornerRadius(20)
                    .frame(width: width, height: 10, alignment: .center)
                    .position(x: width / 2, y: height / 3)
            Rectangle()
                    .fill(Color(.black))
                    .cornerRadius(20)
                    .frame(width: width, height: 10, alignment: .center)
                    .position(x: width / 2, y: height * 2 / 3)
        }
    }

}