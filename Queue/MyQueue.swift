//
//  MyQueue.swift
//  Queue
//
//  Created by 홍정아 on 2021/06/24.
//

import Foundation

struct MyQueue {
    
    enum Error: Swift.Error {
        case unknown
        case empty
    }
    
    private var queue: [Double] = []
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(item: Double) -> Result<[Double], Error> {
        queue.append(item)
        return .success(queue)
    }
    
    mutating func enqueue(items: [Double]) -> Result<[Double], Error> {
        for item in items {
            queue.append(item)
        }
        return .success(queue)
    }

    mutating func dequeue() -> Result<Double, Error> {
        guard queue.isEmpty == false else {
            return .failure(.empty)
        }
        return .success(queue.removeFirst())
    }
    
    mutating func dequeue(count: UInt) -> Result<[Double], Error> {
        guard queue.isEmpty == false else {
            return .success([])
        }
        
        var count = count
        while !queue.isEmpty && count > 0 {
            queue.removeFirst()
            count -= 1
        }
        return .success(queue)
    }
}
