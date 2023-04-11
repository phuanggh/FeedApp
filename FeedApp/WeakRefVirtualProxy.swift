//
//  WeakRefVirtualProxy.swift
//  FeediOS
//
//  Created by Penny Huang on 2023/3/10.
//

import UIKit
import Feed
import FeediOS

// create a proxy to forward a weak reference, so that it won't create a retain cycle presenter and loadingView
// mamory management lives in Composer instead of MVP components
final class WeakRefVirtualProxy<T: AnyObject> {
    private weak var object: T?
    
    init(_ object: T) {
        self.object = object
    }
}

extension WeakRefVirtualProxy: FeedLoadingView where T: FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel) {
        object?.display(viewModel)
    }
}

extension WeakRefVirtualProxy: FeedImageView where T: FeedImageView, T.Image == UIImage {
    func display(_ model: FeedImageViewModel<UIImage>) {
        object?.display(model)
    }
}

extension WeakRefVirtualProxy: FeedErrorView where T: FeedErrorView {
    func display(_ viewModel: FeedErrorViewModel) {
        object?.display(viewModel)
    }
}
