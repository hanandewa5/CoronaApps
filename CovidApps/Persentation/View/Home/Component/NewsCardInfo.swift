//
//  NewsCardInfo.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 24/12/22.
//

import Foundation
import SwiftUI

struct NewsCardInfo: View {
    
    var dates: String
    var content: String
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                HStack(spacing:185){
                    Text(dates)
                        .font(.system(size: 16, design: .default)).italic()
                    Image(systemName: "arrow.right")
                }
                Text(content)
                    .font(.system(size: 18, design: .default)).padding(.top,1)
            }.padding(.all, 20)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}
