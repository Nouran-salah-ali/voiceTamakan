//
//  Untitled.swift
//  voiceTamakan
//
//  Created by nouransalah on 27/05/1447 AH.
//

import AVFoundation
import Combine
class AudioRecordingViewModel: ObservableObject {
   
    
    let audioEngine = AVAudioEngine()

    func startRecording() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Session error: \(error)")
        }

        let inputNode = audioEngine.inputNode
        let format = inputNode.inputFormat(forBus: 0)

        inputNode.removeTap(onBus: 0)

        inputNode.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, time in
            print("Captured audio: \(buffer.frameLength)")
        }

        do {
            try audioEngine.start()
            print("Engine started")
        } catch {
            print("Engine start error: \(error)")
        }
    }//start

    func stopRecording() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        print("Engine stopped")
    }//stop
}
