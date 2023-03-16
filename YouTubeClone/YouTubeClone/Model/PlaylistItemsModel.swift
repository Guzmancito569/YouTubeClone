//
//  PlaylistItemsModel.swift
//  YouTubeClone
//
//  Created by Byron Guzman 3/15/23.
//

import Foundation

struct PlaylistItemsModel: Decodable {
    let kind: String
    let etag: String
    let items: [PlaylistItems]
    let pageInfo: PageInfo
    
    struct PlaylistItems: Decodable {
        let kind: String
        let etag: String
        let id: String
        let snippet: Snippet
    }
    
    struct PageInfo: Decodable {
        let totalResults: Int
        let resultsPerPage: Int
    }
}
