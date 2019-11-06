//
//  DetectTextWithFirebaseMLVision.swift
//  DetectTextApp
//
//  Created by Volkan Sonmez on 6.11.2019.
//  Copyright © 2019 Porte. All rights reserved.
//

import Foundation
import FirebaseMLVision

public class DetectTextWithFirebase: IDetectText
{
    private var textRecognizer: VisionTextRecognizer!;
    
    init()
    {
        self.setUp();
    }
    
    func setUp()
    {
        let vision = Vision.vision();
        self.textRecognizer = vision.onDeviceTextRecognizer();
    }
    
    func getText(image: UIImage, onSuccess: @escaping ((String) -> Void), onError: @escaping ((String) -> Void)) {
        self.textRecognizer.process(VisionImage(image: image)) { (text, error) in
            if let error = error {
                onError(error.localizedDescription);
                return;
            }
            if let text = text {
                onSuccess(text.text);
            }
        }
    }
}
