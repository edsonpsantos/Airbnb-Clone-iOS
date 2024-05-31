//
//  ListingItemView.swift
//  Airbnb
//
//  Created by EDSON SANTOS on 31/05/2024.
//

import SwiftUI

struct ListingItemView: View {
    

    
    var body: some View {
        VStack(spacing: 8){
            //images
           ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            //listing details
            HStack(alignment: .top){
                //details
                VStack(alignment: .leading){
                    Text("Lisbon, Lisbon")
                        .fontWeight(.semibold)
                    
                    Text("12 km away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4){
                        Text("€48")
                            .fontWeight(.semibold)
                        
                        Text("night")
                        
                    }
                }
                
                Spacer()
                
                //rating
                RatingView(ratingValue: "4.8")
            }
            .foregroundStyle(.black)
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView()
        .padding()
}
