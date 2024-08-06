//
//  SoundManager.swift
//  RadioM
//
//  Created by Erik Valigurský on 06/08/2024.
//

import SwiftUI
import AVKit

    class SoundManager {
        
        static let instance = SoundManager()

        var player: AVAudioPlayer?
        
        func playStream() {

            guard let url = URL(string: "https://dreamsiteradiocp5.com/proxy/radiomariaslomp3?mp=/stream.mp3") else { return } //vsetko funguje :D skoro
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch let error {
                print("Error playing sound. \(error.localizedDescription)")
            }
            
        }
    }

    struct StreamRadio: View {
        
        
        var body: some View {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
        }
    }
