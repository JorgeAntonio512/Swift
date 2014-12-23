//
//  TaskStore.swift
//  TaskMe
//
//  Created by George Anthony Pazdral II on 12/23/14.
//  Copyright (c) 2014 George Anthony Pazdral II. All rights reserved.
//

import Foundation

class TaskStore {
    class var sharedInstance: TaskStore {
        struct Static {
            static let instance = TaskStore()
        }
        return Static.instance
    }
    
    
    var tasks: [Task] = []
    var count: Int {
            return tasks.count
    }
    
    func add(task: Task) {
        tasks.append(task)
    }
    
    
    func replace(task: Task, atIndex index: Int) {
        tasks[index] = task
    }
    
    
    func get(index: Int) -> Task {
        return tasks[index]
    }
    
    func removeTaskAtIndex(index: Int) {
        tasks.removeAtIndex(index)
    }
    
}