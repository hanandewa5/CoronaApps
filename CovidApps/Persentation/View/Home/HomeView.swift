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
    @ObservedObject var vm = HomeView.ViewModel()
    
    var body: some View{
        NavigationView {
            ScrollView{
                VStack(alignment: .center){
                    TabView(selection: $index){
                        if vm.statistics != nil && vm.statistics!.regions.count > 0 {
                            
                            ForEach((0..<(vm.statistics?.regions.count ?? 0)), id: \.self){index in
                                let item = vm.statistics?.regions[index]
                                BannerCardInfo(
                                    province: item?.name ?? "",
                                    dates: vm.statistics?.timestamp ?? 0,
                                    infected: item?.numbers.infected ?? 0,
                                    recovered: item?.numbers.recovered ?? 0,
                                    fatal: item?.numbers.fatal ?? 0
                                )
                                
                            }
                        } else {
                            BannerCardInfo(
                                province: "DKI JAKARTA",
                                dates: 0,
                                infected: 0,
                                recovered: 0,
                                fatal: 0
                            ).redacted(reason: .placeholder)
                        }
                        
                    }
                    .frame(height:240)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.top, 16)
                    
                    HStack(spacing: 2) {
                        ForEach((0..<min(35, (vm.statistics?.regions.count ?? 0))), id: \.self) { index in
                            Rectangle()
                                .fill(index == self.index ? Color.blue : Color.gray)
                                .frame(height: 4)
                                .cornerRadius(3)
                            
                        }
                    }.padding(.horizontal, 32)
                    
                    
                    Text("News")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .padding(.top,16)
                        .padding(.horizontal,16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if vm.news != nil && vm.news!.count > 0 {
                        ForEach((vm.news ?? []), id: \.title){ item in
                            NewsCardInfo(
                                dates: item.timestamp,
                                content: item.title
                            )
                        }
                        
                    } else {
                        ForEach((0..<5),id: \.self){ index in
                            NewsCardInfo(
                                dates:0,
                                content: "item.title"
                            ).redacted(reason: .placeholder)
                            
                        }
                    }
                }
            }
        }
    }
}
