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
                                 .aspectRatio(contentMode: .fit)
                                 .frame(width: 50, height: 50)
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
            .navigationTitle(Constants.sampleTitle)
            .onAppear {
                viewModel.fetchListings()
            }
        }
    }
}
