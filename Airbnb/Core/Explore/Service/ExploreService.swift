//
//  ExploreService.swift
//  Airbnb
//
//  Created by EDSON SANTOS on 03/06/2024.
//

import Foundation

class ExploreService {
    
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
