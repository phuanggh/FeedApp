//
//  FeedLoaderStub.swift
//  FeedAppTests
//
//  Created by Penny Huang on 2023/3/29.
//

import Feed

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result

    init(result: FeedLoader.Result) {
        self.result = result
    }

    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
