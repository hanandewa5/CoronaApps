//
//  BannerCardInfo.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 24/12/22.
//

import Foundation
import SwiftUI


struct BannerCardInfo: View {
    
    var province: String
    var dates: String
    var infected: Int
    var recovered: Int
    var fatal: Int
    
    var body: some View {
        HStack(alignment: .center) {
            VStack() {
                Text(province)
                    .font(.system(size: 26, weight: .bold, design: .default))
                Text(dates)
                    .font(.system(size: 16, design: .default))
                HStack(spacing:50) {
                    VStack{
                        Image(systemName: "microbe.fill")
                            .resizable()
                            .frame(width: 48,height: 48)

                        Text("$" + String.init(format: "%0.2f", infected))
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .padding(.top, 8)
                        }
                    VStack{
                        Image(systemName: "microbe.fill")
                            .resizable()
                            .frame(width: 48,height: 48)
                        Text("$" + String.init(format: "%0.2f", recovered))
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .padding(.top, 8)
                        }
                    VStack{
                        Image(systemName: "microbe.fill")
                            .resizable()
                            .frame(width: 48,height: 48)
                        Text("$" + String.init(format: "%0.2f", fatal))
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .padding(.top, 8)
                        }

                }.padding(.all, 16)
            }.padding(.all, 20)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}
