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
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: listing.imageUrls.first ?? "")) { image in
                    image.resizable()
                         .scaledToFit()
                         .frame(height: 300)
                } placeholder: {
                    ProgressView()
                }
                Text(listing.name)
                    .font(.largeTitle)
                    .padding()
                Text(listing.price)
                    .font(.title2)
                    .foregroundColor(.gray)
                Text("Created At: \(listing.createdAt)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .navigationTitle(listing.name)
    }
}
