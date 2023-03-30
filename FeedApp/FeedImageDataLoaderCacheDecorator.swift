//
//  FeedImageDataLoaderCacheDecorator.swift
//  FeedApp
//
//  Created by Penny Huang on 2023/3/30.
//

import Foundation
import Feed

public class FeedImageDataLoaderCacheDecorator: FeedImageDataLoader {
    private let decoratee: FeedImageDataLoader
    private let cache: FeedImageDataCache

    public init(decoratee: FeedImageDataLoader, cache: FeedImageDataCache) {
        self.decoratee = decoratee
        self.cache = cache
    }

    public func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
        return decoratee.loadImageData(from: url) { [weak self] result in
            completion(result.map { data in
                self?.cache.save((try? result.get()) ?? Data(), for: url) { _ in }
                return data
            })
        }
    }
}
