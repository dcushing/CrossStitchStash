//
//  AppRouter.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI

@Observable final class AppRouter {
    var threadsRouter = ThreadsRouter()
    var patternsRouter = PatternsRouter()
    var selectedTab = Tab.threads.rawValue

    func navigateTo(tab: Tab) {
        selectedTab = tab.rawValue
    }
}

enum Tab: Int, Identifiable, CaseIterable {
    case threads = 0
    case patterns = 1
    var id: Int { return self.rawValue }
}
