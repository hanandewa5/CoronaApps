//
//  SearchView.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 24/12/22.
//

import Foundation
import SwiftUI

struct SearchView : View {
    let array = ["Peter", "Paul", "Mary", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"]
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        NavigationView {
            VStack {
                // Search view
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass").foregroundColor(Color.accentColor)
                        
                        TextField("search", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        })
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
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
                    HospitalCardInfo(
                        title: "RS UMUM",
                        address: "JL. Perjuangan",
                        phone: "0812321321",
                        province: "Jakarta",
                        region: "JAKARTA"
                    )
                }.padding()
            }
        }
        
        
        
    }
}
