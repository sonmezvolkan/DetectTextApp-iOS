//
//  HelperInjection.swift
//  DetectTextApp
//
//  Created by Volkan Sonmez on 6.11.2019.
//  Copyright © 2019 Porte. All rights reserved.
//

import Foundation

public class HelperInjection
{
    static func getVisionInstance() -> IDetectText
    {
        return DetectTextWithFirebase();
    }
}
