//
//  HTTPClientStub.swift
//  FeedAppTests
//
//  Created by Penny Huang on 2023/4/11.
//

import Foundation
import Feed

class HTTPClientStub: HTTPClient {
    private class Task: HTTPClientTask {
        func cancel() {
            
        }
    }
    
    private let stub: (URL) -> HTTPClient.Result
        
    init(stub: @escaping (URL) -> HTTPClient.Result) {
        self.stub = stub
    }
    
    func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) -> Feed.HTTPClientTask {
        completion(stub(url))
        return Task()
    }
    
    static var offline: HTTPClientStub {
        HTTPClientStub { _ in
            .failure(NSError(domain: "offline", code: 0))
        }
    }
    
    static func online(_ stub: @escaping (URL) -> (Data, HTTPURLResponse)) -> HTTPClientStub {
        HTTPClientStub { url in
                .success(stub(url))
        }
    }
}
