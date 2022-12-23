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
