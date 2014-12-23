//
//  DismissSegue.swift
//  TaskMe
//
//  Created by George Anthony Pazdral II on 12/23/14.
//  Copyright (c) 2014 George Anthony Pazdral II. All rights reserved.
//

import UIKit

@objc(DismissSegue) class DismissSegue: UIStoryboardSegue {
   
    override func perform() { if let controller = sourceViewController.presentingViewController? { controller.dismissViewControllerAnimated(true, completion: nil) } }
    
}
