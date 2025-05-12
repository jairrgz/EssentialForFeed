//
//  RemoteFeedLoaderTests.swift
//  EssentialForFeed
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 11/05/25.
//

import EssentialForFeed
import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
    
}

class HTTPClient {
    static var shared = HTTPClient()
    func get(from url: URL) { }
    
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    override func get(from url: URL) {
        requestedURL = url
    }
}


class RemoteFeedLoaderTests: XCTestCase {
    
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        //Arrange
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader()
        //Act
        sut.load()
        //Assert
        XCTAssertNotNil(client.requestedURL)
    }
}
