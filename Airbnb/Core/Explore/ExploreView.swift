//
//  ExploreView.swift
//  Airbnb
//
//  Created by EDSON SANTOS on 31/05/2024.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        
        NavigationStack{
            VStack {
                SearchAndFilterBar()
                ScrollView{
                    LazyVStack(spacing: 32){
                        ForEach(0...10, id:\.self){ listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Int.self) { listing in
                    Text("Listing Detail View...")
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
