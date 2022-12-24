//
//  HomeWebRepository.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 25/12/22.
//

import Combine
import Foundation

protocol HomeWebRepository: RemoteDataSource {
    func loadStatistics() -> AnyPublisher<[Statistic], Error>
    func loadNews() -> AnyPublisher<[News], Error>
    
}

struct HomeWebRepositoryImpl: HomeWebRepository {
    
    let session: URLSession
    let baseURL: String
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func loadStatistics() -> AnyPublisher<[Statistic], Error> {
        return call(endpoint: API.allStatistics)
    }
    
    func loadNews() -> AnyPublisher<[News], Error> {
        return call(endpoint: API.allNews)
    }
}

// MARK: Endpoints

extension HomeWebRepositoryImpl {
    enum API {
        case allStatistics
        case allNews
    }
}

extension HomeWebRepositoryImpl.API: BaseApiClient {
    var path: String {
        switch self {
        case .allStatistics:
            return "/stats"
        case .allNews:
            return "/news"
        }
    }
    var method: String {
        switch self {
        case .allStatistics, .allNews:
            return "GET"
        }
    }
    var headers: [String: String]? {
        return ["Accept": "application/json"]
    }
    func body() throws -> Data? {
        return nil
    }
}
