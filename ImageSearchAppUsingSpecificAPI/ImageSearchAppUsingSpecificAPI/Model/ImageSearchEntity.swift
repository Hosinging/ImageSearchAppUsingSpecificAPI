//
//  ImageSearchEntity.swift
//  ImageSearchAppUsingSpecificAPI
//
//  Created by Theo on 2022/04/07.
//

import Foundation

struct ImageSearchEntity: Codable {
    let documents: [Document]
    let meta: Meta
}
struct Document: Codable, Hashable {
    let collection: String
    let datetime: String?
    let displaySiteName: String?
    let docUrl: String
    let height: Int
    let imageUrl: String
    let thumbnailUrl: String
    let width: Int
    
    enum CodingKeys: String, CodingKey {
        case collection, datetime, height, width
        case displaySiteName = "display_sitename"
        case docUrl = "doc_url"
        case imageUrl = "image_url"
        case thumbnailUrl = "thumbnail_url"
    }
}

struct Meta: Codable {
    let isEnd: Bool
    
    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
    }
}
