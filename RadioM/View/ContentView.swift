//
//  ContentView.swift
//  RadioM
//
//  Created by Erik Valigurský on 06/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying: Bool = false
    
    
    
    var body: some View {
        
        
        
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Image("Maria")
                    .mask {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 300, height: 300, alignment: .center)
                        
                    }
                    .shadow(color: .blue, radius: 20, x: 0.0, y: 10)
                WebView()
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                    .padding()
                Spacer()
                VStack {
                    Button {
                        SoundManager.instance.playStream()
                        isPlaying.toggle()
                    } label: {
                        Image(systemName: isPlaying ?  "pause.circle" : "play.circle")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .contentTransition(.symbolEffect)
                    }
                    Text(isPlaying ?  "Pause" : "Play")
                        .foregroundStyle(.blue)
                        .shadow(radius: 10)
                }
//                .background(.green)
                .padding(.bottom)
   
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//            .background(.yellow)

            
        }
        
        
        
        
        
    }
}

#Preview {
    ContentView()
}
