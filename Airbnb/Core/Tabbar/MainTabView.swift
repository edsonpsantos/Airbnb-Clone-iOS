//
//  MainTabView.swift
//  Airbnb
//
//  Created by EDSON SANTOS on 31/05/2024.
//

import SwiftUI

struct MainTabView: View {
    
    
    var body: some View {
        TabView{
            
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            
            WhishlistsView()
                .tabItem { Label("Wishlists", systemImage: "heart.fill") }

            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.circle") }
        }
        
    }
}

#Preview {
    MainTabView()
}
