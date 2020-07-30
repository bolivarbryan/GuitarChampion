//
//  ContentView.swift
//  KitchenSink
//
//  Created by Bryan Bolivar on 29/07/20.
//  Copyright © 2020 Bryan Bolivar. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var counter = 0
    @State var audioPlayer:AVAudioPlayer?
    @State var isPlaying : Bool = false

    let sound = Bundle.main.path(forResource: "Note 1", ofType: "m4a")

    enum Note: String {
        case Mi = "Note 6"
        case Si = "Note 5"
        case Sol = "Note 4"
        case Re = "Note 3"
        case La = "Note 2"
        case MiGrave = "Note 1"
    }
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                
                self.audioPlayer = AVAudioPlayer()

                self.isPlaying.toggle()

                let url = URL(fileURLWithPath: sound!)

                do {
                    self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                    self.audioPlayer?.prepareToPlay()
                    self.audioPlayer?.play()
                }catch {
                    print("Error")
                }
                
                
            }
            if counter > 0 {
                Text("You've tapped \(counter) times")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
