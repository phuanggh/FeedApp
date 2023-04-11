//
//  UIRefreshControl+TestHelpers.swift
//  FeedAppTests
//
//  Created by Penny Huang on 2023/4/11.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        // TableViewController 不會因為user 手動pull refresh觸發refresh control而自動更新table content
        // 當使用者觸發refresh，control會產生valueChanged event
        // You must associate a target and action method with this event and use them to refresh your table’s contents
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .valueChanged)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
