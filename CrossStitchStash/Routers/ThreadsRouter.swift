//
//  ThreadsRouter.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI

@Observable final class ThreadsRouter {
    var navigationPath = NavigationPath()

    enum Route: Hashable {
        case detail(thread: Thread)
        case new
    }

    func navigateTo(route: Route) {
        navigationPath.append(route)
    }
}
