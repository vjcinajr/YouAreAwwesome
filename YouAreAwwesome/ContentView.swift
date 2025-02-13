//
//  ContentView.swift
//  YouAreAwwesome
//
//  Created by VINCENT CINA on 2/7/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber: Int = -1
    @State private var lastImageNumber: Int = -1
    @State private var lastSoundNumber: Int = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn: Bool = true
    
    let numberOfImages: Int = 10    // Ten images labeled image0 - image9
    let numberOfSounds: Int = 5     // Ten images labeled sound0 - sound4
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            Spacer()
            HStack {
                Text("Sound On")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                Spacer()
                Button("Show Message") {
                    let messages = ["You are Great",
                                    "Gadzooks my friend! I am astonished at how utterly magnificent you are!",
                                    "When the Genius Bar Needs Help, They Call You!",
                                    "You are Awesome!",
                                    "Fabulous? That's You!",
                                    "You are Amazing!",
                                    "You are Superb!",
                                    "You are Fantastic!"]
                    
                    // show a new random message
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber,
                                                           upperBounds: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    
                    // show a new random image
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber,
                                                         upperBounds: numberOfImages-1)
                    imageName = "image\(lastImageNumber)"
                                        
                    // play a new sound
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber,
                                                         upperBounds: numberOfSounds-1)
                    if soundIsOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
        }
        .padding()
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBounds)
        } while newNumber == lastNumber
        return newNumber
    }
    
    func playSound(soundName: String) {
        // play the sound
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
    
}

#Preview {
    ContentView()
}
