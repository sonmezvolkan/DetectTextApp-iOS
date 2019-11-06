//
//  AlertViewConstant.swift
//  DetectTextApp
//
//  Created by Volkan Sonmez on 6.11.2019.
//  Copyright © 2019 Porte. All rights reserved.
//

import Foundation

public class AlertViewConstant
{
    public enum AnimateType: Int
    {
        case BottomToTop = 1
        case TopToBottom = 2
        case LeftToRight = 3
        case RightToLeft = 4
    }
    
    public enum AlertViewType: Int
    {
        case Info = 1
        case Error = 2
        case Success = 3
    }
}
