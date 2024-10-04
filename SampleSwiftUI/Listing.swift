//
//  Listing.swift
//  SampleSwiftUI
//
//  Created by Vicky Kumar on 04/10/24.
//

import Foundation

struct Listing: Codable, Identifiable {
    let id: String
    let createdAt: String
    let price: String
    let name: String
    let imageUrls: [String]
    let imageUrlsThumbnails: [String]
    
    var uid: String {
        return id
    }

    // Map JSON keys
    enum CodingKeys: String, CodingKey {
        case id = "uid"
        case createdAt = "created_at"
        case price, name
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}

struct Response: Codable {
    let results: [Listing]
    let pagination: Pagination
}

struct Pagination: Codable {
    let key: String?
}
