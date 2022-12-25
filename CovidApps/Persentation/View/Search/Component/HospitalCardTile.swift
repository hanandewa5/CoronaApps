//
//  HospitalCardTile.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 24/12/22.
//

import Foundation
import SwiftUI

struct HospitalCardTile: View{
    var label: String
    var value: String
    
    var body: some View{
        HStack{
            Text(label).font(.system(size: 16, design: .default)).italic()
            Spacer()
            Text(value)
                .font(.system(size: 18, design: .default)).padding(.top,1)
                .multilineTextAlignment(.trailing)
        }

    }
}
