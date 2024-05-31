//
//  RatingView.swift
//  Airbnb
//
//  Created by EDSON SANTOS on 31/05/2024.
//

import SwiftUI

struct RatingView: View {
    
    var ratingValue: String = "4.0"
    
    var body: some View {
        HStack(spacing: 2){
            Image(systemName: "star.fill")
            
            Text("\(ratingValue)")
        }
    }
}

#Preview {
    RatingView()
}
