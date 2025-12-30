//
//  ContentView.swift
//  Smile Detector
//
//  Created by Andrew Vale on 16/12/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var faceModel: FaceModel = FaceModel()
    
    var body: some View {
        ZStack {
            
            ARViewContainer()
                .ignoresSafeArea()
                .environmentObject(faceModel)
            
            VStack {
                Text("SMILE DETECTOR")
                    .padding()
                Spacer()
                
                if faceModel.isSmiling{
                    Text("Is smiling :)")
                        .transition(.opacity)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
