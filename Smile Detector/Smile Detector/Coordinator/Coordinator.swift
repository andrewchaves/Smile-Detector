//
//  Coordinator.swift
//  Smile Detector
//
//  Created by Andrew Vale on 23/12/25.
//

import ARKit

class Coordinator: NSObject, ARSessionDelegate {
    
    private var faceModel: FaceModel
    
    init(faceModel: FaceModel) {
        self.faceModel = faceModel
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        guard let faceAnchor = anchors.first(where: {$0 is ARFaceAnchor}) as? ARFaceAnchor else { return }
        
        DispatchQueue.main.async {
            self.faceModel.updatePoints(faceAnchor: faceAnchor)
        }
    }
}
