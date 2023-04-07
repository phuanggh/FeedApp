//
//  FeedAppUITestsLaunchTests.swift
//  FeedAppUITests
//
//  Created by Penny Huang on 2023/3/22.
//

import XCTest
import Feed
import FeediOS

final class FeedAppUIAcceptanceTests: XCTestCase {

    func test_onLaunch_displaysRemoteFeedWhenCustomerHasConnectivity() {
        let app = XCUIApplication()
        
        app.launch()
        
        XCTAssertEqual(app.cells.count, 22)
        XCTAssertEqual(app.cells.firstMatch.images.count, 1)
    }
}
