//
//  FacePointsModel.swift
//  Smile Detector
//
//  Created by Andrew Vale on 23/12/25.
//

import SwiftUI
internal import Combine
import ARKit

@MainActor
class FaceModel: ObservableObject {
    
    @Published var isSmiling: Bool = false
    
    private let smileOnThreshold: Float = 0.75
    private let smileOffThreshold: Float = 0.60

    func updatePoints(faceAnchor: ARFaceAnchor) {        
        verifySmiles(faceAnchor: faceAnchor)
    }
    
    private func verifySmiles(faceAnchor: ARFaceAnchor) {
        let left = faceAnchor.blendShapes[.mouthSmileLeft]?.floatValue ?? 0
        let right = faceAnchor.blendShapes[.mouthSmileRight]?.floatValue ?? 0
        
        let smileValue = max(left, right)
        
        if !isSmiling && smileValue > smileOnThreshold {
            isSmiling = true
        } else if isSmiling && smileValue < smileOffThreshold {
            isSmiling = false
        }
    }
}
