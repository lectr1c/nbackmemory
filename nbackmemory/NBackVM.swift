//
// Created by Abdulrazzaq Summaq on 2022-11-16.
//

import Foundation
import AVFoundation
import UIKit

class NBackVM : ObservableObject {
    let synthesizer = AVSpeechSynthesizer()
    var theModel = NBackModel()
    @Published var markers : [aMarker] = initMarkers();
    @Published var settings = SettingsModel(n: 1, visual: true, audio: true, delay: 2.0, numberOfRounds: 10)
    var clickedAudio = false
    var clickedVisual = false
    var timerIsOn = false
    var result: ResultModel
    var state: SaveData?
    var isLoaded = false

    var audioIsCorrect : Bool = false;
    var visualIsCorrect : Bool = false;


    var timer : Timer?;

    func resetGame() {
        markers = initMarkers();
        theModel.resetGame();
    }

    init() {
        result = ResultModel(n: 1, delay: 1)
        state = nil;
    }

    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: settings.delay, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }

    @objc func tick() {
        clickedAudio = false;
        clickedVisual = false;
        audioIsCorrect = false;
        visualIsCorrect = false;

        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()


        if theModel.roundCount >= settings.numberOfRounds {
            endRound()
        } else {
            theModel.roundCount += 1

            run()

            if !theModel.gameIsActive {
                timer?.invalidate()
                timerIsOn = false
            }
        }
    }

    func run() {
        let move = theModel.tick()
        resetMarkers()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.resetMarkers()
        }
        if(settings.visual){
            markers[move.position].state = true
        }
        if(settings.audio){
            speech(move.letter)
        }
    }

    func speech(_ text: String){
        let crossVoice = AVSpeechUtterance(string: text)
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        synthesizer.speak(crossVoice)
    }

    func resetMarkers() {
        markers = initMarkers();
    }

    func startRound() {
        theModel.resetGame()
        theModel.gameIsActive = true
        if(!timerIsOn){
            timerIsOn = true
            startTimer()
        }
        result = ResultModel(n: settings.n, delay: settings.delay)
    }

    func endRound() {
        speech("Game stopped")
        theModel.gameIsActive = false;
        theModel.roundCount = 0;
        timer?.invalidate()
        timerIsOn = false;

        clickedAudio = false;
        clickedVisual = false;
        audioIsCorrect = false;
        visualIsCorrect = false;


        result.totalRounds = theModel.roundCount
        state!.results.insert(result, at: 0)

        print("Saving")
        saveState()
        theModel.resetGame()
        resetMarkers()
    }

    func loadState() {
        FileModel.loadState()

        DispatchQueue.main.asyncAfter(deadline: .now()  + 0.5) {

            if let state = FileModel.saveState {
                self.state = state
                self.settings = state.settings
                self.theModel.nVal = self.settings.n
                self.result.n = self.settings.n
                self.result.delay = self.settings.delay
                self.result.totalRounds = self.settings.numberOfRounds
                print("Loaded settings from file")
            } else {
                self.state = SaveData(settings: self.settings, results: [self.result])
                FileModel.saveState(self.state!)
            }
            self.isLoaded = true
        }
    }

    func saveState() {
        state!.settings = settings
        theModel.nVal = settings.n;
        FileModel.saveState(self.state!)
    }

    func checkVisualBack() -> Bool {
        clickedVisual = true
        visualIsCorrect = theModel.checkVisualBack();

        if visualIsCorrect {
            result.numberRightsVisual += 1
        }else{
            result.numberWrongsVisual += 1
        }

        return visualIsCorrect;
    }

    func checkAudioBack() -> Bool {
        clickedAudio = true
        audioIsCorrect = theModel.checkAudioBack();

        if audioIsCorrect {
            result.numberRightsAudio += 1
        } else {
            result.numberWrongsAudio += 1
        }

        return audioIsCorrect;
    }
}

func initMarkers() -> [aMarker] {
    return [
        aMarker(id: 0, state: false, x: 0, y: 0),
        aMarker(id: 1, state: false, x: 1, y: 0),
        aMarker(id: 2, state: false, x: 2, y: 0),
        aMarker(id: 3, state: false, x: 0, y: 1),
        aMarker(id: 4, state: false, x: 1, y: 1),
        aMarker(id: 5, state: false, x: 2, y: 1),
        aMarker(id: 6, state: false, x: 0, y: 2),
        aMarker(id: 7, state: false, x: 1, y: 2),
        aMarker(id: 8, state: false, x: 2, y: 2)
    ]
}

struct aMarker: Hashable, Codable, Identifiable {
    var id: Int
    var state : Bool
    var x: Int
    var y: Int
}