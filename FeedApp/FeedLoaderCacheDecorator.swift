//
//  FeedLoaderCacheDecorator.swift
//  FeedAppTests
//
//  Created by Penny Huang on 2023/3/30.
//

import Feed

public final class FeedLoaderCacheDecorator: FeedLoader {
    private let decoratee: FeedLoader
    private let cache: FeedCache
    
    public init(decoratee: FeedLoader, cache: FeedCache) {
        self.decoratee = decoratee
        self.cache = cache
    }
    
    public func load(completion: @escaping (FeedLoader.Result) -> Void) {
        decoratee.load { [weak self] result in
            completion(result.map { feed in
                self?.cache.saveIgnoringResulst(feed)
                return feed
            })
        }
    }
}

private extension FeedCache {
    func saveIgnoringResulst(_ feed: [FeedImage]) {
        save(feed) { _ in }
    }
}
