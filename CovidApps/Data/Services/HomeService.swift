//
//  HomeService.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 25/12/22.
//

import Combine
import Foundation
import SwiftUI

protocol HomeService {
    func loadStatistics() -> AnyPublisher<[Statistic], Error>
}

struct RealHomeService: HomeService {
    let webRepository: HomeWebRepository
    let appState: Store<AppState>
    
    init(webRepository: HomeWebRepository,appState: Store<AppState>) {
        self.webRepository = webRepository
        self.appState = appState
    }
    
    func loadStatistics() -> AnyPublisher<[Statistic], Error> {
        return webRepository.loadStatistics()
    }



}

struct StubHomeService: HomeService {
    
    func refreshHomeData() -> AnyPublisher<Void, Error> {
        return Just<Void>.withErrorType(Error.self)
    }
    
    func loadStatistics()  -> AnyPublisher<[Statistic], Error> {
        return Just<[Statistic]>.withErrorType([],Error.self)
    }
}

