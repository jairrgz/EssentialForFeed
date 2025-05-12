//
//  RemoteFeedLoaderTests.swift
//  EssentialForFeed
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 11/05/25.
//

import EssentialForFeed
import XCTest

class RemoteFeedLoader {
    
    
}

class HTTPClient {
    var requestedURL: URL?
    
}
class RemoteFeedLoaderTests: XCTestCase {
    
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        let sut = RemoteFeedLoader()
//        sut.load()
        
        XCTAssertNil(client.requestedURL)
        
        
    }
}
