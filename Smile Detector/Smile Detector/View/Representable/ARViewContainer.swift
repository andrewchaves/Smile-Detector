//
//  ARViewContainer.swift
//  Smile Detector
//
//  Created by Andrew Vale on 23/12/25.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    
    @EnvironmentObject var faceModel: FaceModel
    
    func makeUIView(context: Context) -> UIView {
        let arView = ARView(frame: UIScreen.main.bounds)
        arView.session.delegate = context.coordinator
        
        let config = ARFaceTrackingConfiguration()
        arView.session.run(config, options: [])
        
        return arView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Nothing to do here.
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(faceModel: faceModel)
    }
}
