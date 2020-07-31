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
    @State private var phase = 0.0
    @State private var chordsOpacity = 1.0

    var body: some View {
        NavigationView {
            ZStack {
                ForEach(0..<6) { i in
                    Wave(strength: 5,
                         frequency: 10,
                         phase: self.phase)
                        .stroke(Color.gray,
                                lineWidth: 5)
                        .offset(x: (CGFloat(i) * 50) - 120)
                        .opacity(chordsOpacity)
                }
                
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
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    self.phase = .pi * 2
                }
            }
            .navigationBarTitle(Text("Guitar Champion"))
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

struct CircleButton: View {
    @Environment(\.colorScheme) var colorScheme
    @State var note: Note
    @State private var animation = 0.0
    var animationSpeed = 1.0

    var body: some View {
        
        Button(action: {
            playAudio(note: note)
            animation = 0.0
            withAnimation(Animation.easeOut(duration: animationSpeed)) {
                animation = 1
            }
        }, label: {
            Text(note.name)
                .font(.largeTitle)
                .frame(width: 60, height: 60)
        })
            .buttonStyle(PulsingButtonStyle.init(animation: animation))
        
    }
    
    func playAudio(note: Note) {
        GSAudio.sharedInstance.playSound(soundFileName: note.rawValue)
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

struct Wave: Shape {
    var animatableData: Double {
        get { phase }
        set { self.phase = newValue }
    }

    var strength: Double
    var frequency: Double
    var phase: Double

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        let width = Double(rect.width)
        let height = Double(rect.height)
        let midWidth = width / 2
        let midHeight = height / 2
        let oneOverMidHeight = 1 / midHeight
        let wavelength = height / frequency
        path.move(to: CGPoint(x: midWidth, y: 0))

        for y in stride(from: 0, through: height, by: 1) {
            let relativeY = y / wavelength
            let distanceFromMidHeight = y - midHeight
            let normalDistance = oneOverMidHeight * distanceFromMidHeight
            let parabola = -(normalDistance * normalDistance) + 1
            let sine = sin(relativeY + phase)
            let x = parabola * strength * sine + midWidth
            path.addLine(to: CGPoint(x: x, y: y))
        }

        return Path(path.cgPath)
    }
}


