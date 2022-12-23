//
//  CardModifier.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 24/12/22.
//

import Foundation
import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(.secondarySystemBackground))
            .cornerRadius(20)
    }
    
}
