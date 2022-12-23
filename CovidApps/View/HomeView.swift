//
//  home_view.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 24/12/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var index = 0
    var body: some View{
        ScrollView {
            VStack(alignment: .center){
                TabView(selection: $index){
                    ForEach((0..<25), id: \.self){index in
                        BannerCardInfo(
                            province: "Semarang",
                            dates: "30 Januari 2020",
                            infected: 1000,
                            recovered: 1000,
                            fatal: 1000
                        )

                    }
                }
                .frame(height:220)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack(spacing: 2) {
                    ForEach((0..<25), id: \.self) { index in
                        Rectangle()
                            .fill(index == self.index ? Color.blue : Color.gray)
                            .frame(width: 10, height: 5)
                            .cornerRadius(3)

                    }
                }
                
                
                Text("News")
                    .font(.system(size: 26, weight: .bold, design: .default))
                    .padding(.top,10)
                    .padding(.horizontal,10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                NewsCardInfo(
                    dates: "30 Januari 2020",
                    content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
                )
                NewsCardInfo(
                    dates: "30 Januari 2020",
                    content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
                )
                NewsCardInfo(
                    dates: "30 Januari 2020",
                    content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
                )

            }
        }
    }
}

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


struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20)
//            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}
