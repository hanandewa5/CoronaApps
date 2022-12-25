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
    var dates: Double
    var infected: Int
    var recovered: Int
    var fatal: Int
    
    var body: some View {
        HStack(alignment: .center) {
            VStack() {
                Text(province)
                    .font(.system(size: 26, weight: .bold, design: .default))
                Text(unixToStringDate(unix:dates))
                    .font(.system(size: 16, design: .default))
                HStack() {
                    StatisticCasesCount(image: "infected", title: "Infected", cases: infected)
                    Spacer()
                    StatisticCasesCount(image: "recovered", title: "Recovered", cases: recovered)
                    Spacer()
                    StatisticCasesCount(image: "fatal", title: "Fatal", cases: fatal)
                }.padding(.all, 16)
            }.padding(.all, 20)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .modifier(CardModifier())
        .padding(.all, 16)
    }
}

struct BannerCardInfoSkelton: View {
    var body: some View {
        HStack(alignment: .center) {
            VStack() {
                Rectangle().frame(width: 140,height: 50).redacted(reason: .placeholder )
//                Text(province)
//                    .font(.system(size: 26, weight: .bold, design: .default))
//                Text(unixToStringDate(unix:dates))
//                    .font(.system(size: 16, design: .default))
                HStack() {
//                    StatisticCasesCount(image: "infected", title: "Infected", cases: infected)
//                    Spacer()
//                    StatisticCasesCount(image: "recovered", title: "Recovered", cases: recovered)
//                    Spacer()
//                    StatisticCasesCount(image: "fatal", title: "Fatal", cases: fatal)
                }.padding(.all, 16)
            }.padding(.all, 20)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .modifier(CardModifier())
        .padding(.all, 16)
    }
}


struct StatisticCasesCount: View {
    var image: String
    var title: String
    var cases: Int
    
    var body: some View{
        VStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 48,height: 48)
                .clipped()
            Text(title)
                .font(.system(size: 14))
                .padding(.top, 3).italic()
            Text(decimalFormat(n:cases))
                .font(.system(size: 16, weight: .bold, design: .default))
                .padding(.top, 1)
        }
        
    }
}
