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

    var body: some View {
        ZStack {
            BorderedCircle(color: Color(red: 0.87, green: 0.73, blue: 0.52),
                           borderColor: Color(red: 0.54, green: 0.411, blue: 0.07))
            
            VStack{
                HStack {
                    CircleButton(note: .MiGrave)
                    Spacer()
                    CircleButton(note: .Re)
                }
                .padding()
                HStack {
                    CircleButton(note: .Mi)
                    Spacer()
                    CircleButton(note: .Sol)
                }
                .padding()
            }
            .padding()
            
            VStack {
                CircleButton(note: .La)
                Spacer()
                CircleButton(note: .Si)
            }
            .padding()
            
            Image(systemName: "music.note")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .padding()
        }
        .frame(width: 400, height: 400, alignment: .trailing)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

struct CircleButton: View {
    @Environment(\.colorScheme) var colorScheme
    @State var note: Note
    
    var body: some View {
        AnimatedButton(buttonStyle: PulsingButtonStyle.self, action: {
            print(note.rawValue)
     
        }, label: {
            Text(note.name)
                .font(.largeTitle)
                .frame(width: 60, height: 60)
        }, animationSpeed: 1, note: note)
      
    }
    

}

struct BorderedCircle: View {
    @State var color: Color
    @State var borderColor: Color
    
    var body: some View {
        Circle()
            .fill(color)
            .overlay(
                Circle()
                    .stroke(lineWidth: 10).fill(borderColor)
            )
    }
}


protocol AnimatingButtonStyle: ButtonStyle {
    init(animation: Double)
}

struct PulsingButtonStyle: AnimatingButtonStyle {
    let animation: Double

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0.54, green: 0.411, blue: 0.07))
            .clipShape(Circle())
            .foregroundColor(.white)
            .padding(4)
            .overlay(
                Circle()
                    .stroke(Color(red: 0.54, green: 0.411, blue: 0.07), lineWidth: 2)
                    .scaleEffect(CGFloat(1 + animation))
                    .opacity(1 - animation)
            )
    }
}

struct AnimatedButton<ButtonStyle: AnimatingButtonStyle,  Content: View>: View {
    let buttonStyle: ButtonStyle.Type
    let action: () -> Void
    let label: () -> Content
    var animationSpeed = 5.0
    @State var note: Note
    @State private var animation = 0.0

    var body: some View {
        Button(action: {
            playAudio(note: note)
            animation = 0.0
            withAnimation(Animation.easeOut(duration: animationSpeed)) {
                animation = 1
            }
        }, label: label)
            .buttonStyle(buttonStyle.init(animation: animation))
            
    }
    
    func playAudio(note: Note) {
        GSAudio.sharedInstance.playSound(soundFileName: note.rawValue)
    }
}

