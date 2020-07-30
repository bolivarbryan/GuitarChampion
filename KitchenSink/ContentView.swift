//
//  ContentView.swift
//  KitchenSink
//
//  Created by Bryan Bolivar on 29/07/20.
//  Copyright © 2020 Bryan Bolivar. All rights reserved.
//

import SwiftUI
import AVFoundation


class GSAudio: NSObject, AVAudioPlayerDelegate {

    static let sharedInstance = GSAudio()

    private override init() { }

    var players: [URL: AVAudioPlayer] = [:]
    var duplicatePlayers: [AVAudioPlayer] = []

    func playSound(soundFileName: String) {

        guard let bundle = Bundle.main.path(forResource: soundFileName, ofType: "m4a") else { return }
        let soundFileNameURL = URL(fileURLWithPath: bundle)

        if let player = players[soundFileNameURL] { //player for sound has been found

            if !player.isPlaying { //player is not in use, so use that one
                player.prepareToPlay()
                player.play()
            } else { // player is in use, create a new, duplicate, player and use that instead

                do {
                    let duplicatePlayer = try AVAudioPlayer(contentsOf: soundFileNameURL)

                    duplicatePlayer.delegate = self
                    //assign delegate for duplicatePlayer so delegate can remove the duplicate once it's stopped playing

                    duplicatePlayers.append(duplicatePlayer)
                    //add duplicate to array so it doesn't get removed from memory before finishing

                    duplicatePlayer.prepareToPlay()
                    duplicatePlayer.play()
                } catch let error {
                    print(error.localizedDescription)
                }

            }
        } else { //player has not been found, create a new player with the URL if possible
            do {
                let player = try AVAudioPlayer(contentsOf: soundFileNameURL)
                players[soundFileNameURL] = player
                player.prepareToPlay()
                player.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }


    func playSounds(soundFileNames: [String]) {
        for soundFileName in soundFileNames {
            playSound(soundFileName: soundFileName)
        }
    }

    func playSounds(soundFileNames: String...) {
        for soundFileName in soundFileNames {
            playSound(soundFileName: soundFileName)
        }
    }

    func playSounds(soundFileNames: [String], withDelay: Double) { //withDelay is in seconds
        for (index, soundFileName) in soundFileNames.enumerated() {
            let delay = withDelay * Double(index)
            let _ = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(playSoundNotification(_:)), userInfo: ["fileName": soundFileName], repeats: false)
        }
    }

    @objc func playSoundNotification(_ notification: NSNotification) {
        if let soundFileName = notification.userInfo?["fileName"] as? String {
            playSound(soundFileName: soundFileName)
        }
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if let index = duplicatePlayers.index(of: player) {
            duplicatePlayers.remove(at: index)
        }
    }

}

struct ContentView: View {
    @State var counter = 0
    @State var audioPlayer:AVAudioPlayer? = AVAudioPlayer()
    @State var isPlaying : Bool = false

    let sound = Bundle.main.path(forResource: "Note 1", ofType: "m4a")

    enum Note: String {
        case Mi = "Note 6"
        case Si = "Note 5"
        case Sol = "Note 4"
        case Re = "Note 3"
        case La = "Note 2"
        case MiGrave = "Note 1"
        
        var soundURL: String? {
            switch self {
            case .Mi:
                return Bundle.main.path(forResource: "Note 6", ofType: "m4a")
            case .Si:
                return Bundle.main.path(forResource: "Note 5", ofType: "m4a")
            case .Sol:
                return Bundle.main.path(forResource: "Note 4", ofType: "m4a")
            case .Re:
                return Bundle.main.path(forResource: "Note 3", ofType: "m4a")
            case .La:
                return Bundle.main.path(forResource: "Note 2", ofType: "m4a")
            case .MiGrave:
                return Bundle.main.path(forResource: "Note 1", ofType: "m4a")
            }
        }
    }
    
    func playAudio(note: Note) {
        self.isPlaying.toggle()

        let url = URL(fileURLWithPath: note.soundURL!)
        GSAudio.sharedInstance.playSound(soundFileName: note.rawValue)
    }
    
    var body: some View {
        
        HStack {
            Button(action: { playAudio(note: .MiGrave) }){
                Text("Mi")
                    .foregroundColor(.white)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue))
                    .compositingGroup()
                    .shadow(color: .black, radius: 3)
            }
            
            
            Button(action: { playAudio(note: .La) }){
                Text("La")
                    .foregroundColor(.white)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue))
                    .compositingGroup()
                    .shadow(color: .black, radius: 3)
            }
            Button(action: { playAudio(note: .Re) }){
                Text("Re")
                    .foregroundColor(.white)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue))
                    .compositingGroup()
                    .shadow(color: .black, radius: 3)
            }
            Button(action: { playAudio(note: .Sol) }){
                Text("Sol")
                    .foregroundColor(.white)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue))
                    .compositingGroup()
                    .shadow(color: .black, radius: 3)
            }
            
            Button(action: { playAudio(note: .Si) }){
                Text("Si")
                    .foregroundColor(.white)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue))
                    .compositingGroup()
                    .shadow(color: .black, radius: 3)
            }
            Button(action: { playAudio(note: .Mi) }){
                Text("Mi")
                    .foregroundColor(.white)
                    .padding(15)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue))
                    .compositingGroup()
                    .shadow(color: .black, radius: 3)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
