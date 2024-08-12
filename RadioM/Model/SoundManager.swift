//
//  SoundManager.swift
//  RadioM
//
//  Created by Erik Valigurský on 06/08/2024.
//

//import SwiftUI
//import AVKit
import AVFoundation
import MediaPlayer
import SwiftUI
   
 
        
class AudioManager: ObservableObject {
            static let shared = AudioManager()
            private var player: AVPlayer?
            private var session = AVAudioSession.sharedInstance()
            @Published var isPlaying: Bool = false // bud to das false tuto alebo do init
            
    init() {
//        let isPlaying = false
//        self.isPlaying = isPlaying
    }
        
        
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
                      isPlaying = true
                  }
              }


            func setupRemoteTransportControls() {
                let commandCenter = MPRemoteCommandCenter.shared()
                
                commandCenter.playCommand.isEnabled = true
                commandCenter.playCommand.addTarget { [unowned self] event in
                    if !isPlaying {
                        startAudio()
                        return .success
                    }
                    return .commandFailed
                }
                
                commandCenter.pauseCommand.isEnabled = true
                commandCenter.pauseCommand.addTarget { [unowned self] event in
                    if isPlaying {
                        pause()
                        return .success
                    }
                    return .commandFailed
                }
                
            }
            
            func pause() {
                    if let player = player {
                        player.pause()
                        isPlaying = false
                    }
                }
            func play() {
                    if let player = player {
                        player.play()
                        isPlaying = true
                    }
                }


        }
                 
