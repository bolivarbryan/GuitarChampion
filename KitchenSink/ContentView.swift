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
            Circle()
                .fill(Color.black)
                .opacity(0.6)
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3).fill(Color.purple)
                )
            VStack{
                HStack {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 100, height: 100, alignment: .trailing)
                        .overlay(
                            Text("MI")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                                    playAudio(note: .MiGrave)
                                })
                        )
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 3).fill(Color.purple)
                        )
                    Spacer()
                    Circle()
                        .fill(Color.red)
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        .overlay(
                            Text("RE")
                                .font(.largeTitle)
                                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                                    playAudio(note: .Re)
                                })
                        )
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 3).fill(Color.purple)
                        )
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 3).fill(Color.purple)
                        )
                }
                .padding()
                HStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100, alignment: .trailing)
                        .overlay(
                            Text("Mi-")
                                .font(.largeTitle)
                                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                                    playAudio(note: .Mi)
                                })
                        )
                    Spacer()
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        .overlay(
                            Text("SOL")
                                .font(.largeTitle)
                                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                                    playAudio(note: .Sol)
                                })
                        )
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 3).fill(Color.purple)
                        )
                }
                .padding()
            }
            .padding()
            
            VStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 100, height: 100, alignment: .trailing)
                        .overlay(
                            Text("LA")
                                .font(.largeTitle)
                                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                                    playAudio(note: .La)
                                })
                        )
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 3).fill(Color.purple)
                        )
                    Spacer()
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .trailing)
                        .overlay(
                            Text("SI")
                                .font(.largeTitle)
                                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                                    playAudio(note: .Si)
                                })
                        )
                        .overlay(
                            Circle()
                                .stroke(lineWidth: 3).fill(Color.purple)
                        )
            }
            .padding()
            
            Circle()
                .fill(Color.clear)
                .frame(height:150)
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3).fill(Color.purple)
                )
                
        }
        .frame(width: 400, height: 400, alignment: .trailing)
       
    }
    
    func playAudio(note: Note) {
        GSAudio.sharedInstance.playSound(soundFileName: note.rawValue)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}


/*
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

 */
