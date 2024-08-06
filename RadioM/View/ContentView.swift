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
//                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
//                    .padding()

                WebView()
                
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                    .padding()
                Spacer()
                VStack {
                    Button {
                        
                        isPlaying.toggle()
                    } label: {
                        Image(systemName: isPlaying ? "play.circle" : "pause.circle")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .contentTransition(.symbolEffect)
                    }
                    Text(isPlaying ? "Play" : "Pause")
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
