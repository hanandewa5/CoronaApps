//
//  HomeViewModel.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 25/12/22.
//

import Foundation
import SwiftUI

extension HomeView {
    class ViewModel: ObservableObject{
        private let homeService = Services()
        
        @Published var statistics: Statistic? = Statistic(type: "", name: "Test", timestamp: 0, numbers: nil, regions: [])
        @Published var news: [News]?
        
        init() {
            homeService.getStatistics() { data in
                DispatchQueue.main.async {
                    self.statistics = data
                }
            }
            homeService.getNews() { data in
                DispatchQueue.main.async {
                    self.news = data
                }
            }
        }
    

    }
}
