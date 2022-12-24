//
//  AppState.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 25/12/22.
//

import SwiftUI
import Combine

struct AppState: Equatable {
    var system = System()
}

extension AppState {
    struct System: Equatable {
        var isActive: Bool = false
    }
}

func == (lhs: AppState, rhs: AppState) -> Bool {
    return lhs.system == rhs.system
}

#if DEBUG
extension AppState{
    static var preview: AppState{
        var state = AppState()
        state.system.isActive = true
        return state
    }
}
#endif
