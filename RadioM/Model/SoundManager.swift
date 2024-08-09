//
//  SoundManager.swift
//  RadioM
//
//  Created by Erik Valigurský on 06/08/2024.
//

//import SwiftUI
//import AVKit
import AVFoundation
import SwiftUI


//    class SoundManager {
//        
//        static let instance = SoundManager()
//
//        var player: AVAudioPlayer?
//        
//        func playStream() {
//
//            guard let url = URL(string: "https://dreamsiteradiocp5.com/proxy/radiomariaslomp3?mp=/stream.mp3") else { return } //vsetko funguje :D skoro
//            
//            do {
//                player = try AVAudioPlayer(contentsOf: url)
//                player?.play()
//            } catch let error {
//                print("Error playing sound. \(error.localizedDescription)")
//            }
//            
//        }
//    }
//
//    struct SoundManager: View {
        
        
        class AudioManager {
            static let shared = AudioManager()
            private var player: AVPlayer?
            private var session = AVAudioSession.sharedInstance()
            init() {}
        
        
        func configureAudioSession() {
            // Retrieve the shared audio session.
            let audioSession = AVAudioSession.sharedInstance()
            do {
                // Set the audio session category and mode.
                try audioSession.setCategory(.playback, mode: .default)
            } catch {
                print("Failed to set the audio session configuration")
            }
        }
        
        func startAudio() {
            // activate our session before playing audio
            configureAudioSession()
                  
                  // TODO: change the url to whatever audio you want to play
                  let url = URL(string: "https://dreamsiteradiocp5.com/proxy/radiomariaslomp3?mp=/stream.mp3")
                  let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
                  if let player = player {
                      player.replaceCurrentItem(with: playerItem)
                  } else {
                      player = AVPlayer(playerItem: playerItem)
                  }
                  
                  if let player = player {
                      player.play()
                  }
              }
        }
        
        
//        var body: some View {
//            
//Text("Pes")
//            
//        }
//    }
//             func activateSession() {
//                do{
//                    try @session.setCategory(
//                        .playback,
//                        mode: .default,
//                        options: []
//                    )
//                } catch _ {}
//
//                do {
//                    try session.setActive(true, options: .notifyOthersOnDeactivation)
//                } catch _ {}
//
//                do {
//                    try session.overrideOutputAudioPort(.speakers)
//
//                } catch _ {}
//
//            }

            
            
            
            
