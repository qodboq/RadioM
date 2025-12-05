//
//  ContentView.swift
//  RadioM
//
//  Created by Erik Valigurský on 06/08/2024.
//

import SwiftUI


struct ContentView: View {
    
    @State var audioManager: AudioManager = AudioManager()
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                GeometryReader { geometry in
                    let imageSize = min(geometry.size.width, geometry.size.height) * 0.9
                    Image("Maria")
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageSize, height: imageSize)
                        .clipShape(Circle())
                        .shadow(color: .blue, radius: 20, x: 0.0, y: 10)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                .frame(height: 250)
                
                WebView()
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                    .padding()
                Spacer()
                VStack {
                    Button {
                        if audioManager.isPlaying == false {
                            AudioManager.shared.startAudio()
                            AudioManager.shared.setupRemoteTransportControls()
                        } else {
                            AudioManager.shared.pause()
                            AudioManager.shared.setupRemoteTransportControls()
                        }
                        audioManager.isPlaying.toggle()
                    } label: {
                        Image(systemName: audioManager.isPlaying ?  "pause.circle" : "play.circle")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .contentTransition(.symbolEffect)
                    }
                    Text(audioManager.isPlaying ?  "Pause" : "Play")
                        .foregroundStyle(.blue)
                        .shadow(radius: 10)
                }
                .padding(.bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    ContentView()
}
