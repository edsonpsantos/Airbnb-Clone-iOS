//
//  ListingItemView.swift
//  Airbnb
//
//  Created by EDSON SANTOS on 31/05/2024.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8){
            //images
           ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            //listing details
            HStack(alignment: .top){
                //details
                VStack(alignment: .leading){
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    
                    Text("12 km away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4){
                        Text("€\(listing.pricePerMight)")
                            .fontWeight(.semibold)
                        
                        Text("night")
                        
                    }
                }
                
                Spacer()
                
                //rating
                RatingView(ratingValue: "\(listing.rating)")
            }
            .foregroundStyle(.black)
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
        .padding()
}
