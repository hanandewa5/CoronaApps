//
//  NewsCardInfo.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 24/12/22.
//

import Foundation
import SwiftUI

struct NewsCardInfo: View {
    
    var dates: Double
    var content: String
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                HStack{
                    Text(unixToStringDate(unix: dates))
                        .font(.system(size: 16, design: .default)).italic()
                    Spacer()
                    Image(systemName: "arrow.right")
                }
                Text(content)
                    .font(.system(size: 18, design: .default)).padding(.top,1)
            }.padding(.all, 20)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .modifier(CardModifier())
        .padding(.horizontal, 16)
        .padding(.bottom,10)
    }
}
