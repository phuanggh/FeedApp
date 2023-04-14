//
//  UIView+TestHelpers.swift
//  FeedAppTests
//
//  Created by Penny Huang on 2023/4/14.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
