//
// Created by Abdulrazzaq Summaq on 2022-11-12.
//

import Foundation

struct NBackModel {
    var nVal : Int = 1;
    var visualMemArray: [Int] = [];
    var auditoryMemArray: [String] = [];
    var gameIsActive: Bool = false;
    var roundCount : Int = 0;

    let charSet : [String] = ["a", "b", "q", "s"];

    mutating func resetGame() {
        auditoryMemArray = [];
        visualMemArray = [];
        gameIsActive = false;
        roundCount = 0;
    }

    func checkVisualBack() -> Bool {
        let size = visualMemArray.count;
        if size < nVal { return false; }

        let pos = size - nVal - 1;
        if visualMemArray[size-1] == visualMemArray[pos] { return true; }

        return false;
    }

    func checkAudioBack() -> Bool{
        if auditoryMemArray.count < nVal { return false; }

        let size = auditoryMemArray.count;
        if size < nVal { return false; }

        let pos = size - nVal - 1;
        if auditoryMemArray[size-1] == auditoryMemArray[pos] { return true; }

        return false;
    }

    mutating func tick() -> Data {
        let letter : String = charSet[Int.random(in: 0..<charSet.count)];
        let position : Int = Int.random(in: 0..<9);

        auditoryMemArray.append(letter);
        visualMemArray.append(position);

        return Data(letter: letter, position: position);
    }

    struct Data {
        let letter : String;
        let position: Int;
    }
}

