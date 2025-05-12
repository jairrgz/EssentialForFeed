//
//  RemoteFeedLoaderTests.swift
//  EssentialForFeed
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 11/05/25.
//

import EssentialForFeed
import XCTest

class RemoteFeedLoader {
    
    let client: HTTPClient
    init(client: HTTPClient) {
        self.client = client
    }
    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }
    
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    func get(from url: URL) {
        requestedURL = url
    }
}


class RemoteFeedLoaderTests: XCTestCase {
    
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(client: client)
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        //Arrange
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        //Act
        sut.load()
        //Assert
        XCTAssertNotNil(client.requestedURL)
    }
}
