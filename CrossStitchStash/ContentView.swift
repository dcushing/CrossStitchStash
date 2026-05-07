//
//  ContentView.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 12/6/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var appRouter = AppRouter()

    var body: some View {
        TabView(selection: $appRouter.selectedTab) {
            ForEach(Tab.allCases) { tab in
                ContentTabView(tab: tab)
            }
        }
    }
}

private struct ContentTabView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var appRouter = AppRouter()
    let tab: Tab
    
    @ViewBuilder
    var body: some View {
        Group {
            switch tab {
            case .threads:
                ThreadStashView(viewModel: ThreadStashViewModel(modelContext: modelContext), router: appRouter.threadsRouter)
            case .patterns:
                PatternStashView(viewModel: PatternStashViewModel(modelContext: modelContext), router: appRouter.patternsRouter)
            }
        }
        .tabItem { Label(tab.label, systemImage: tab.systemImage) }
        .tag(tab.rawValue)
    }
}


private extension Tab {
    var label: String {
        switch self {
        case .threads:
            return "Threads"
        case .patterns:
            return "Patterns"
        }
    }
    
    var systemImage: String {
        switch self {
        case .threads:
            return "rectangle.and.paperclip"
        case .patterns:
            return "circle.grid.3x3"
        }
    }
}

//#Preview {
//    ContentView()
//}
