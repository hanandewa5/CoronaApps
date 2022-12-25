//
//  StatisticService.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 25/12/22.
//

import Foundation

let baseUrl: String = "https://dekontaminasi.com/api/id/covid19/"

class Services {
    func getStatistics(_ completion:@escaping (Statistic) -> () ) {
        Bundle.main.fetchData(url: "\(baseUrl)/stats", model: Statistic.self){
            data in completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func getNews(_ completion:@escaping ([News]) -> () ) {
        Bundle.main.fetchData(url: "\(baseUrl)/news", model: [News].self){
            data in completion(data)
        } failure: { error in
            print(error)
        }
    }
    
    func getHospital(_ completion:@escaping ([Hospital]) -> () ) {
        Bundle.main.fetchData(url: "\(baseUrl)/hospitals", model: [Hospital].self){
            data in completion(data)
        } failure: { error in
            print(error)
        }
    }

}
