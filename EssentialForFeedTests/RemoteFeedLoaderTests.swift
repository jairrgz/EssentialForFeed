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

class RemoteFeedLoaderTests: XCTestCase {
    
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        //Arrange
        let url = URL(string: "http://a-give-url.com")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        
        //Assert
        XCTAssertEqual(client.requestedURL, url)
    }
    
    private func makeSUT(url: URL = URL(string: "http://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        func get(from url: URL) {
            requestedURL = url
        }
    }

}
