//
//  PlaylistModel.swift
//  YouTubeClone
//
//  Created by Byron Guzman on 3/12/23.
//

import Foundation

struct PlaylistModel: Decodable {
    let kind: String
    let etag: String
    let pageInfo: PageInfo
    let items: [Item]
    
    struct PageInfo: Decodable {
        let totalResults: Int
        let resultsPerPage: Int
    }
    
    struct Item: Decodable {
        let kind: String
        let etag: String
        let id: String
        let snippet: Snippet
        let contentDetails: ContentDetails
        
        struct Snippet: Decodable {
            let publishedAt: String
            let channelId: String
            let title: String
            let description: String
            let thumbnails: Thumbnails
            let channelTitle: String
            let localized: Localized
            
            struct Thumbnails: Decodable {
                let medium: Medium
                
                struct Medium: Decodable {
                    let url: String
                    let width: Int
                    let height: Int
                }
            }
            
            struct Localized: Decodable {
                let title: String
                let description: String
            }
        }
        
        struct ContentDetails: Decodable {
            let itemCount: Int
        }
    }
}
