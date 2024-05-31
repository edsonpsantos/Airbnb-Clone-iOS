//
//  ListingItemView.swift
//  Airbnb
//
//  Created by EDSON SANTOS on 31/05/2024.
//

import SwiftUI

struct ListingItemView: View {
    
    //mockdata
    var images = [
    "listing-1",
    "listing-2",
    "listing-3",
    "listing-4",
    ]
    
    var body: some View {
        VStack(spacing: 8){
            //images
            TabView{
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
            
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
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    
                    Text("4.86")
                }
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView()
        .padding()
}
