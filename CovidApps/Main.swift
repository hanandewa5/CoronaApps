//
//  CovidAppsApp.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 23/12/22.
//

import SwiftUI

@main
struct Main: App {
    let environment = AppEnvironment.bootstrap()
    
    var body: some Scene {
        WindowGroup {
            TabbarView()
//            ContentView(viewModel: ContentView.ViewModel(container: environment.container))
        }
    }
}

struct ContentView {
    
    @ObservedObject private(set) var viewModel: ViewModel
    
    var body: some View{
        ZStack{
            Text("TES")
        }
    }
    
}

extension ContentView {
    class ViewModel: ObservableObject {
        let container: DIContainer
        
        init(container: DIContainer) {
            self.container = container
        }
        
    }
}
