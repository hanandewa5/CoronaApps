//
//  SearchView.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 24/12/22.
//

import Foundation
import SwiftUI

struct SearchView : View {
    @ObservedObject var vm = SearchView.ViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        NavigationView {
            VStack {
                // Search view
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass").foregroundColor(Color.accentColor)
                        
                        TextField("search", text: $vm.searchText)
                        Button(action: {
                            vm.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(vm.searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 12, leading: 10, bottom: 12, trailing: 10))
                    .background(Color(colorScheme == .dark ?.black :.white))
                    .cornerRadius(30)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .navigationBarHidden(true) // .animation(.default) // animation does not work properly
                
                ScrollView {
                    LazyVStack{
                        ForEach(vm.filteredHospitals, id: \.phone){ item in
                            HospitalCardInfo(
                                title: item.name,
                                address: item.address,
                                phone: item.phone ?? "",
                                province: item.province,
                                region: item.region
                            )
                        }
                    }
                }.padding()
            }
        }
        
        
        
    }
}
