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


struct HospitalCardInfo: View {
    
    var title: String
    var address: String
    var phone: String
    var province: String
    var region: String
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var expanded = false
    
    var body: some View {
        HStack(alignment: .center) {
            DisclosureGroup(title){
                VStack(alignment: .leading) {
                    Divider()
                    HospitalCardTile(label: "Address", value: address)
                    HospitalCardTile(label: "Phone", value: phone)
                    HospitalCardTile(label: "Province", value: province)
                    HospitalCardTile(label: "Region", value: region)
                }.padding(.top,10)
            }
            .accentColor(colorScheme == .dark ? .white : .black)
//            .foregroundColor(.black)
            .padding(.all, 12)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .modifier(CardModifier())
    }
}

struct HospitalCardTile: View{
    var label: String
    var value: String
    
    var body: some View{
        HStack{
            Text(label).font(.system(size: 16, design: .default)).italic()
            Spacer()
            Text(value)
                .font(.system(size: 18, design: .default)).padding(.top,1)
        }

    }
}


//struct CardModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .cornerRadius(20)
//            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
//    }
//
//}
