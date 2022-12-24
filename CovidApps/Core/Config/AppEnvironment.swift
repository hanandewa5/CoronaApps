//
//  AppEnvironment.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 25/12/22.
//

import Combine
import SwiftUI

struct AppEnvironment {
    let container: DIContainer
}

extension AppEnvironment{
    
    static func bootstrap() -> AppEnvironment {
        let appState = Store<AppState>(AppState())
        let session = configuredURLSession()
        let webRepositories = configuredWebRepositories(session: session)
        let services = configuredServices(appState: appState,
                                                webRepositories: webRepositories)
        let diContainer = DIContainer(appState: appState, services: services)
        return AppEnvironment(container: diContainer)
    }
    
    private static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }
    
    private static func configuredWebRepositories(session: URLSession) -> DIContainer.WebRepositories {
        let homeRepository = HomeWebRepositoryImpl(
            session: session,
            baseURL: "https://restcountries.com/v2")
        return .init(homeRepository: homeRepository)
    }

    private static func configuredServices(appState: Store<AppState>,
                                           webRepositories: DIContainer.WebRepositories
    ) -> DIContainer.Services {
        
        let homeService = RealHomeService(
            webRepository: webRepositories.homeRepository,
            appState: appState
        )
        
        return .init(homeService: homeService)
    }

    
}

extension DIContainer {
    struct WebRepositories {
        let homeRepository: HomeWebRepository
    }
}
