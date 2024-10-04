//
//  ListingsView.swift
//  SampleSwiftUI
//
//  Created by Vicky Kumar on 04/10/24.
//

import SwiftUI

struct ListingsView: View {
    @StateObject private var viewModel = ListingsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.listings) { listing in
                NavigationLink(destination: ListingDetailView(listing: listing)) {
                    HStack {
                        AsyncImage(url: URL(string: listing.imageUrls.first ?? "")) { image in
                            image.resizable()
                                 .scaledToFit()
                                 .frame(width: 100, height: 100)
                        } placeholder: {
                            ProgressView()
                        }
                        VStack(alignment: .leading) {
                            Text(listing.name)
                                .font(.headline)
                            Text(listing.price)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Sample listings")
            .onAppear {
                viewModel.fetchListings()
            }
        }
    }
}
