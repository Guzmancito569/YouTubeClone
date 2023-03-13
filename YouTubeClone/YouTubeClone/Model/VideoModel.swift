//
//  VideoModel.swift
//  YouTubeClone
//
//  Created by Byron Guzman on 3/12/23.
//

import Foundation

// MARK: - VideoModel
struct VideoModel: Codable {
    let kind, etag: String
    let items: [Item]
    let pageInfo: PageInfo
}

// MARK: - Item
struct Item: Codable {
    let kind, etag, id: String
    let snippet: Snippet
    let contentDetails: ContentDetails
    let status: Status
    let statistics: Statistics
    let topicDetails: TopicDetails
}

// MARK: - ContentDetails
struct ContentDetails: Codable {
    let duration, dimension, definition, caption: String
    let licensedContent: Bool
    let projection: String
}

// MARK: - RecordingDetails
struct RecordingDetails: Codable {
}

// MARK: - Snippet
struct Snippet: Codable {
    let publishedAt: Date
    let channelID, title, description: String
    let thumbnails: Thumbnails
    let channelTitle: String
    let tags: [String]
    let categoryID, liveBroadcastContent: String
    let localized: Localized
    let defaultAudioLanguage: String

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title, description, thumbnails, channelTitle, tags
        case categoryID = "categoryId"
        case liveBroadcastContent, localized, defaultAudioLanguage
    }
}

// MARK: - Localized
struct Localized: Codable {
    let title, description: String
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high, standard: Default
    let maxres: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high, standard, maxres
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String
    let width, height: Int
}

// MARK: - Statistics
struct Statistics: Codable {
    let viewCount, likeCount, favoriteCount, commentCount: String
}

// MARK: - Status
struct Status: Codable {
    let uploadStatus, privacyStatus, license: String
    let embeddable, publicStatsViewable, madeForKids: Bool
}

// MARK: - TopicDetails
struct TopicDetails: Codable {
    let topicCategories: [String]
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}

