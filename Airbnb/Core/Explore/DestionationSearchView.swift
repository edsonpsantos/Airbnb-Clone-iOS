//
//  DestionationSearchView.swift
//  Airbnb
//
//  Created by EDSON SANTOS on 31/05/2024.
//

import SwiftUI


enum DestinalSearchOption{
    case location
    case dates
    case guests
}

struct DestionationSearchView: View {
    
    
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinalSearchOption = .location
    
    var body: some View {
        VStack(){
            Button(action: {
                withAnimation(.snappy){
                    show.toggle()
                }
            }, label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            })
            
            VStack(alignment:.leading) {
                
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add Destination")
                }
            }
            .padding()
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius:8)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .location
                }
            }
            
            VStack{
                if selectedOption == .dates{
                    HStack{
                        Text("Show expanded View")
                        Spacer()
                    }
                    
                } else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .padding()
            .frame(height: selectedOption == .dates ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius:8)
            .onTapGesture {
                withAnimation(.snappy){selectedOption = .dates}
            }
            
            VStack{
                if selectedOption == .guests {
                    
                    HStack{
                        Text("Show expanded View")
                        Spacer()
                    }
                    
                } else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .padding()
            .frame(height: selectedOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius:8)
            .onTapGesture {
                withAnimation(.snappy){selectedOption = .guests}
            }
        }
    }
}

#Preview {
    DestionationSearchView(show: .constant(false))
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
}
