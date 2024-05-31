//
//  ProfileView.swift
//  Airbnb
//
//  Created by EDSON SANTOS on 31/05/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            
            //Profile Login View
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Log in to start planning your next trip")
                }
                
                ButtonView(title: "Log in")
                
                HStack{
                    Text("Don't have an account?")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
            }
            
            
            //Profile Options
            VStack(spacing: 24){
                ProfileOptionRuleView(imageName: "gear", title: "Settings")
                ProfileOptionRuleView(imageName: "gear", title: "Accessibility")
                ProfileOptionRuleView(imageName: "questionmark.circle", title: "Visit the Help Center")
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
