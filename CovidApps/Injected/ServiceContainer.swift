//
//  ServiceContainer.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 25/12/22.
//

extension DIContainer {
    struct Services {
        let homeService: HomeService
        
        init(homeService: HomeService) {
            self.homeService = homeService
        }
        
        static var stub: Self {
            .init(homeService: StubHomeService())
        }
    }
}
