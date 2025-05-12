//
//  FeedLoader.swift
//  
//
//  Created by Jorge Jair Ramirez Gaston Zuloeta on 11/05/25.
//


enum ResultOfLoadFeed {
    case success([FeedItem])
    case failure(Error)
}


public protocol FeedLoader {
    
    func loadItems(completion: @escaping (ResultOfLoadFeed) -> Void)
    
}
