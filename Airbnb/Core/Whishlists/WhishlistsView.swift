//
//  WhishlistsView.swift
//  Airbnb
//
//  Created by EDSON SANTOS on 31/05/2024.
//

import SwiftUI

struct WhishlistsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading, spacing: 32){
                
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    
                    Text("You can create, view or edit whishlists once your have logged in")
                        .font(.footnote)
                    
                    ButtonView(title: "Log in")
                        .padding(.vertical, 32)

                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WhishlistsView()
}
