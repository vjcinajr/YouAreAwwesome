//
//  ContentView.swift
//  YouAreAwwesome
//
//  Created by VINCENT CINA on 2/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber: Int = -1
    @State private var lastImageNumber: Int = -1
    
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
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
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
                
                // generate a new message number not equal to the last message number
                var nextMessageNumber: Int
                repeat {
                    nextMessageNumber = Int.random(in: 0..<messages.count)
                } while lastMessageNumber == nextMessageNumber
                message = messages[nextMessageNumber]
                lastMessageNumber = nextMessageNumber
                
                // generate a new image number not equal to the last image number
                var nextImageNumber: Int
                repeat {
                    nextImageNumber = Int.random(in: 0...9)
                } while lastImageNumber == nextImageNumber
                imageName = "image\(nextImageNumber)"
                lastImageNumber = nextImageNumber
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
