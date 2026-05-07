//
//  PatternsRouter.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI

@Observable final class PatternsRouter {
    var navigationPath = NavigationPath()

    enum Route: Hashable {
        case detail(pattern: Pattern)
        case new
    }

    func navigateTo(route: Route) {
        navigationPath.append(route)
    }
}
