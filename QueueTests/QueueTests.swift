//
//  QueueTests.swift
//  QueueTests
//
//  Created by 홍정아 on 2021/06/24.
//

import XCTest
@testable import Queue

class QueueTests: XCTestCase {

    var queue = MyQueue()

    func test_enqueueSingleItem() {
        XCTAssertEqual(queue.enqueue(item: 1.2), .success([1.2]))
    }

    func test_enqueueItems() {
        XCTAssertEqual(queue.enqueue(items: [5, 4, 3]), .success([5, 4, 3]))
    }

    func test_dequeueSingleItem() {
        queue.enqueue(items: [5, 4, 3])
        XCTAssertEqual(queue.dequeue(), .success(5))
    }

    func test_dequeueItems() {
        queue.enqueue(items: [5, 4, 3])
        XCTAssertEqual(queue.dequeue(count: 2), .success([3]))
    }
    
    func test_dequeueItemsMoreThanQueueLength() {
        queue.enqueue(items: [5, 4, 3])
        XCTAssertEqual(queue.dequeue(count: 5), .success([]))
    }

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
