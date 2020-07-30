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
    
//    func playAudio(note: Note) {
//        GSAudio.sharedInstance.playSound(soundFileName: note.rawValue)
//    }
//
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .opacity(0.3)
            VStack{
                HStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100, alignment: .trailing)
                    Spacer()
                    Circle()
                        .fill(Color.white)
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .trailing)
                }
                .padding()
                HStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100, alignment: .trailing)
                    Spacer()
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .trailing)
                }
                .padding()
            }
            .padding()
            
            VStack {
                
                    Circle()
                        .fill(Color.green)
                        .frame(width: 100, height: 100, alignment: .trailing)
                    Spacer()
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .trailing)
            }
            .padding()
        }
        .frame(width: 400, height: 400, alignment: .trailing)
       
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
