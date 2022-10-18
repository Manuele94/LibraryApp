//
//  VideoResponse.swift
//  LibraryApp
//
//  Created by Emmanuele Montagna on 18/10/22.
//

import Foundation
// MARK: - VideoResponse
// MARK: - YTResponse
struct YTResponse: Codable {
//    let kind, etag: String
    let items: [Item]
//    let nextPageToken: String
//    let pageInfo: PageInfo
}

// MARK: - Item
struct Item: Codable {
    let kind, etag, id: String
    let snippet: Snippet
    let contentDetails: ContentDetails
    let statistics: Statistics
}

// MARK: - ContentDetails
struct ContentDetails: Codable {
    let duration, dimension, definition, caption: String
    let licensedContent: Bool
    let contentRating: ContentRating
    let projection: String
}

// MARK: - ContentRating
struct ContentRating: Codable {
}

// MARK: - Snippet
struct Snippet: Codable {
//    let publishedAt: Date
    let title :String
//    let channelID, title, snippetDescription: String
    let thumbnails: Thumbnails
//    let channelTitle: String
//    let tags: [String]?
// /   let categoryID, liveBroadcastContent: String
//    let defaultLanguage: String?
//    let localized: Localized
//    let defaultAudioLanguage: String

    enum CodingKeys: String, CodingKey {
//        case publishedAt
//        case channelID = "channelId"
        case title
//        case snippetDescription = "description"
        case thumbnails//, channelTitle, tags
//        case categoryID = "categoryId"
//        case liveBroadcastContent,defaultLanguage, localized, defaultAudioLanguage
    }
}

// MARK: - Localized
struct Localized: Codable {
    let title, localizedDescription: String

    enum CodingKeys: String, CodingKey {
        case title
        case localizedDescription = "description"
    }
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high, standard: Default
    let maxres: Default?

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
    let viewCount, likeCount, favoriteCount: String
    let commentCount: String?
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}

typealias YTItem  = Item
typealias YTItems = [Item]
