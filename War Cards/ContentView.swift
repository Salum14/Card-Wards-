//
//  ContentView.swift
//  War Cards
//
//  Created by Macbook Pro on 8/14/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        
        ZStack{
            
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Image("logo")
                HStack{
                    Spacer(minLength: 10)
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                        Image(playerCard)
                    } .foregroundColor(.white)
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                        Image(cpuCard)
                    }.foregroundColor(.white)
                    Spacer()
                }
                Spacer()
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                Spacer()
              
                Button{
                    reset()
                }label: {
                    Image(systemName: "arrow.clockwise")
                        .imageScale(.large)
                }.foregroundColor(.white)
            }
            
        }
        
    }
    
    func deal(){
        // Randomize the players card
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        // Randomize the cpu card
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)

        // Update the score
        if playerCardValue > cpuCardValue {
            
            // Add 1 to playerScore
            playerScore += 1
        }
        else if cpuCardValue > playerCardValue{
            
            // Add 1 to cpuScore
            cpuScore += 1
        }
    }
    func reset(){
        // resets the scoreboard
        cpuScore = 0
        playerScore = 0
    }
}

#Preview {
    ContentView()
}

// Add a Reset Button
