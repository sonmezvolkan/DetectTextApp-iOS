//
//  SCLAlertView.swift
//  DetectTextApp
//
//  Created by Volkan Sonmez on 6.11.2019.
//  Copyright © 2019 Porte. All rights reserved.
//

import Foundation
import SCLAlertView;

public class AlertViewSCL: IAlertView
{

    init()
    {
        self.setUp();
    }
    
    internal func setUp()
    {
        
    }
    
    internal func show(title: String, message: String, type: AlertViewConstant.AlertViewType)
    {
        self.show(title: title, message: message, type: AlertViewConstant.AlertViewType.Info, animateType: AlertViewConstant.AnimateType.BottomToTop)
    }
    
    internal func show(title: String, message: String, type: AlertViewConstant.AlertViewType, animateType: AlertViewConstant.AnimateType)
    {
        let alertView = SCLAlertView(appearance: SCLAlertView.SCLAppearance(
            showCircularIcon: true
        ));
        alertView.showTitle(title, subTitle: message, style: self.convertAlertViewType(type: type));
    }
    
    private func convertAlertViewType(type: AlertViewConstant.AlertViewType) -> SCLAlertViewStyle
    {
        switch type.rawValue {
        case AlertViewConstant.AlertViewType.Success.rawValue:
            return SCLAlertViewStyle.success;
        case AlertViewConstant.AlertViewType.Error.rawValue:
            return SCLAlertViewStyle.error;
        default:
           return SCLAlertViewStyle.success;
        }
    }
}
