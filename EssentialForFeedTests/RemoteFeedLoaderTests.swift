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
    let url: URL
    
    // MARK: - DESIGNATED INITIALIZER
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
        
    }
    
    func load() {
        client.get(from: url)
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
        let url = URL(string: "http://a-url.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        //Arrange
        let client = HTTPClientSpy()
        let url = URL(string: "http://a-given-url.com")!
        let sut = RemoteFeedLoader(url: url, client: client)
        //Act
        sut.load()
        //Assert
        XCTAssertNotNil(client.requestedURL)
    }
}
