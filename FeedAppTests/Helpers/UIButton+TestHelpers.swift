//
//  UIButton+TestHelpers.swift
//  FeedAppTests
//
//  Created by Penny Huang on 2023/4/11.
//

import UIKit

extension UIButton {
    func simulateTap() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
