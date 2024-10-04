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
    private var cancellables = Set<AnyCancellable>()
    private let networkService = NetworkService()

    func fetchListings() {
        Task {
            do {
                let fetchedListings = try await networkService.fetchListings()
                DispatchQueue.main.async {
                    self.listings = fetchedListings
                }
            } catch {
                print("Error fetching listings: \(error.localizedDescription)")
            }
        }
    }
}
