//
//  NetworkService.swift
//  SampleSwiftUI
//
//  Created by Vicky Kumar on 04/10/24.
//

import Foundation
import Combine

class NetworkService {
    func fetchListings() async throws -> [Listing] {
        let url = URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Print the raw data for debugging
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Raw API Response: \(jsonString)")
        }
        
        let decodedResponse = try JSONDecoder().decode([String: [Listing]].self, from: data)
        
        return decodedResponse["results"] ?? []
    }
}
