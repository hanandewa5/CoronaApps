//
//  HospitalCardInfo.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 24/12/22.
//

import Foundation
import SwiftUI


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
            DisclosureGroup(){
                VStack(alignment: .leading) {
                    Divider()
                    HospitalCardTile(label: "Address", value: address)
                    HospitalCardTile(label: "Phone", value: phone)
                    HospitalCardTile(label: "Province", value: province)
                    HospitalCardTile(label: "Region", value: region)
                }.padding(.top,10)
            } label: {
                Text(title)
                    .multilineTextAlignment(.leading)
            }
            .accentColor(colorScheme == .dark ? .white : .black)
            //            .foregroundColor(.black)
            .padding(.all, 12)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .modifier(CardModifier())
    }
}
