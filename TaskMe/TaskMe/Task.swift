//
//  Task.swift
//  TaskMe
//
//  Created by George Anthony Pazdral II on 12/23/14.
//  Copyright (c) 2014 George Anthony Pazdral II. All rights reserved.
//

import Foundation

struct Task {
    let title: String
    let notes: String
    
    init(title: String, notes: String) {
        self.title = title
        self.notes = notes
    }
}
