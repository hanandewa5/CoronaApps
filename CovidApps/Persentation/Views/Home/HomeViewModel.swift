//
//  HomeViewModel.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 24/12/22.
//

import Foundation

extension HomeView{
    class ViewModel: ObservableObject{
        @Published private(set) var statistics: [Statistic] = []
        
        init() {
            loadStatistics()
        }
        
        func loadStatistics(){
//            BaseApiClient.
            
            self.statistics = []
        }
    }
}
