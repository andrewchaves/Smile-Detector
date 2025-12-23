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
    
    func updatePoints(vertices: [SIMD3<Float>], faceAnchor: ARFaceAnchor) {
        
        var worldVertexArray: [SIMD3<Float>] = []
        
        for vertex in vertices {
            let worldVertex4 = faceAnchor.transform * SIMD4<Float>(vertex.x, vertex.y, vertex.z, 1)
            let worldVertex = SIMD3<Float>(worldVertex4.x, worldVertex4.y, worldVertex4.z)
            
            worldVertexArray.append(worldVertex)
        }
    }
    
    func verifySmiles(faceAnchor: ARFaceAnchor, points: [SIMD3<Float>]) {
        
        for (key, value) in faceAnchor.blendShapes {
            let blendShapeName = key.rawValue
            let smileExists = blendShapeName == "mouthSmileRight" || blendShapeName == "mouthSmileLeft"
            if (value.floatValue > 0.75 && smileExists){
                isSmiling = true
            } else {
                isSmiling = false
            }
        }
    }
}
