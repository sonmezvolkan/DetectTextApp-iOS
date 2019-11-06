//
//  IDetectText.swift
//  DetectTextApp
//
//  Created by Volkan Sonmez on 6.11.2019.
//  Copyright © 2019 Porte. All rights reserved.
//

import Foundation
import UIKit;

protocol IDetectText {
    
    func setUp();
    func getText(image: UIImage, onSuccess: @escaping ((String) -> Void), onError: @escaping ((String) -> Void));
}
