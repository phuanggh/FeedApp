//
//  SceneDelegateTests.swift
//  FeedAppTests
//
//  Created by Penny Huang on 2023/4/10.
//

import XCTest
import FeediOS
@testable import FeedApp

class SceneDelegateTests: XCTestCase {
    func test_sceneWillConnectToSession_configureesRootViewController() {
        let sut = SceneDelegate()
        sut.window = UIWindow()
        
        sut.configureWindow()
        
        let root = sut.window?.rootViewController
        let rootNavigation = root as? UINavigationController
        let topController = rootNavigation?.topViewController
        
        XCTAssertNotNil(rootNavigation, "Expected a navigation controller as root, got \(String(describing: root)) instead")
        XCTAssertTrue(topController is FeedViewController, "Expected a feed controller as top view controller, get \(String(describing: topController)) instead")
    }
}
