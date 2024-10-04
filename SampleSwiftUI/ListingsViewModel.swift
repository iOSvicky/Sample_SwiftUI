//
//  ListingsViewModel.swift
//  SampleSwiftUI
//
//  Created by Vicky Kumar on 04/10/24.
//

import Foundation
import Combine

class ListingsViewModel: ObservableObject {
    @Published var listings: [Listing] = []

    func fetchListings() {
        let urlString = Constants.baseURL + Constants.fetchListingsEndpoint
          guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("\(Constants.errorFetchingListings + (error?.localizedDescription ?? Constants.unknownError))")
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data)
                DispatchQueue.main.async {
                    self.listings = response.results
                }
            } catch {
                print("\(Constants.decodingJSONError + error.localizedDescription)")
            }
        }.resume()
    }
}
