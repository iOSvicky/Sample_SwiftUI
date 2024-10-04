//
//  Listing.swift
//  SampleSwiftUI
//
//  Created by Vicky Kumar on 04/10/24.
//

import Foundation

struct Listing: Identifiable, Codable {
    let id = UUID()
    let createdAt: String
    let price: String
    let name: String
    let uid: String
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageUrls = "image_urls"
    }
}
