//
//  ContentView.swift
//  voiceTamakan
//
//  Created by nouransalah on 27/05/1447 AH.
//
import AVFoundation
import SwiftUI



struct ContentView: View {
    @StateObject var audioVM = AudioRecordingViewModel()
    @State var isRecording = false

    var body: some View {
        VStack {
            Button(isRecording ? "Stop" : "Start") {
                if isRecording {
                    audioVM.stopRecording()
                } else {
                    audioVM.startRecording()
                }
                isRecording.toggle()
            }

            Text("Hello, world!")
        }
        .padding()
    }
}//struct

#Preview {
    ContentView()
}


