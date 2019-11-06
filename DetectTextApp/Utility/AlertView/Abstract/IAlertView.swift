//
//  IAlertView.swift
//  DetectTextApp
//
//  Created by Volkan Sonmez on 6.11.2019.
//  Copyright © 2019 Porte. All rights reserved.
//

import Foundation

protocol IAlertView
{
    func setUp();
    func show(title: String, message: String, type: AlertViewConstant.AlertViewType);
    func show(title: String, message: String, type: AlertViewConstant.AlertViewType, animateType: AlertViewConstant.AnimateType);
}
