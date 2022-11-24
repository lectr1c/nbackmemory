//
// Created by Abdulrazzaq Summaq on 2022-11-10.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var theViewModel : NBackVM

    let width : CGFloat
    let height : CGFloat

    @State private var visualMatch = false;
    @State private var audioMatch = false;

    var body: some View {
        ZStack{
            InfoView().position(x: CGFloat(150), y: CGFloat(-20));
            BoardView();
            VStack{
                HStack {
                    Button {
                        audioMatch = theViewModel.checkAudioBack()
                    } label: {
                        Text("AUDIO");
                    }.padding()
                            .background(!theViewModel.clickedAudio ? .blue : audioMatch ? .green : .red)
                            .accentColor(Color(red: 1, green: 1, blue: 1))
                            .disabled(!theViewModel.settings.audio || theViewModel.clickedAudio)
                    Button {
                        visualMatch = theViewModel.checkVisualBack()
                    } label: {
                        Text("VISUAL");
                    }.padding()
                            .background(!theViewModel.clickedVisual ? .blue : visualMatch ? .green : .red)
                            .accentColor(Color(red: 1, green: 1, blue: 1))
                            .disabled(!theViewModel.settings.visual || theViewModel.clickedVisual)
                }
                HStack{
                    Button {
                        print(theViewModel.startRound());
                    } label: {
                        Text("Start Game");
                    }.padding()
                            .background(Color(red: 0, green: 0.482, blue: 1))
                            .accentColor(Color(red: 1, green: 1, blue: 1))
                            .disabled(theViewModel.theModel.gameIsActive)
                    Button {
                        print(theViewModel.endRound());
                    } label: {
                        Text("End Game");
                    }.padding()
                            .background(Color(red: 0, green: 0.482, blue: 1))
                            .accentColor(Color(red: 1, green: 1, blue: 1))
                            .disabled(!theViewModel.theModel.gameIsActive)
                }
            }.position(x: CGFloat(150), y: CGFloat(350))
        }.frame(width: 300, height: 300, alignment: .center);
    }
}