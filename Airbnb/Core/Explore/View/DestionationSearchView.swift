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
    
    @ObservedObject var viewModel: ExploreViewModel
    @Binding var show: Bool
    
    @State private var selectedOption: DestinalSearchOption = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var totalGuests = 0
    
    var body: some View {
        VStack(){
            HStack {
                Button(action: {
                    withAnimation(.snappy){
                        viewModel.updateListingForLocation()
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
            })
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear"){
                        viewModel.searchLocation = ""
                        viewModel.updateListingForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack(alignment:.leading) {
                
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingForLocation()
                                show.toggle()
                            }
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
            .modifier(CollapsableDestionationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){selectedOption = .location}
            }
            
            //Date selection view
            VStack(alignment: .leading){
                if selectedOption == .dates{
                    Text("When is your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack{
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                } else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsableDestionationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy){selectedOption = .dates}
            }

            // Gueses selection View
            VStack(alignment: .leading){
                if selectedOption == .guests {

                    Text("Who is coming?")
                        .font(.title)
                        .fontWeight(.semibold)
         
                    Stepper{
                        Text("\(totalGuests) Adults")
                    } onIncrement: {
                        totalGuests += 1
                    } onDecrement: {
                        guard totalGuests > 0 else {return}
                        totalGuests -= 1
                    }
   
                } else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsableDestionationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){selectedOption = .guests}
            }
            
            Spacer()
        }
    }
}

#Preview {
    DestionationSearchView(viewModel: ExploreViewModel(service: ExploreService()), show: .constant(false))
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


//Custom modifier
struct CollapsableDestionationViewModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius:8)
    }
}
