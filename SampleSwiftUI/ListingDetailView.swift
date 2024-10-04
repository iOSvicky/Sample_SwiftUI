//
//  ListingDetailView.swift
//  SampleSwiftUI
//
//  Created by Vicky Kumar on 04/10/24.
//

import SwiftUI

struct ListingDetailView: View {
    let listing: Listing

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: listing.imageUrls.first ?? "")) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(maxWidth: .infinity)
            } placeholder: {
                ProgressView()
            }
            Text(listing.name)
                .font(.largeTitle)
                .padding()
            Text(listing.price)
                .font(.title2)
                .padding()
            Spacer()
        }
        .navigationTitle(listing.name)
    }
}
