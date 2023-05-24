//
//  Characters.swift
//  ClaseIOSAppExample
//
//  Created by Melvin Antonio Callisaya Tiñini on 28/4/23.
//

import Foundation

// MARK: - Characters
struct Characters: Decodable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let offset, limit, total, count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Decodable {
    let id: Int
    let name, description: String
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]
}

// MARK: - Comics
struct Comics: Decodable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

// MARK: - ComicsItem
struct ComicsItem: Decodable {
    let resourceURI: String
    let name: String
}

// MARK: - Stories
struct Stories: Decodable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItem: Decodable {
    let resourceURI: String
    let name: String
    let type: String
}

enum ItemType: Decodable {
    case cover
    case empty
    case interiorStory
}

// MARK: - Thumbnail
struct Thumbnail: Decodable {
    let path: String
    let thumbnailExtension: String
    enum CodingKeys: String, CodingKey {
        case path, thumbnailExtension = "extension"
    }
}

enum Extension: Decodable {
    case gif
    case jpg
}

// MARK: - URLElement
struct URLElement: Decodable {
    let type: String
    let url: String
}

enum URLType: Decodable {
    case comiclink
    case detail
    case wiki
}
