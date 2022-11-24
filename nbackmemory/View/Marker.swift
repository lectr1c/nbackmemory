//
// Created by Abdulrazzaq Summaq on 2022-11-20.
// Copyright (c) 2022 lectr1c. All rights reserved.
//

import SwiftUI

struct Marker: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var theViewModel : NBackVM

    var marker : Bool
    var id : Int

    var body: some View {
        HStack{
            if(marker){
                Rectangle()
                        .fill(Color(.blue))
                        .cornerRadius(15)
                        .frame(width: 70, height: 70, alignment: .center)
            }else{
                Rectangle().fill(.background)
            }
        }
                .frame(width: 75, height: 75, alignment: .center)
    }
}