//
//  PatternStashView.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI

struct PatternStashView: View {
    @Environment(\.modelContext) private var modelContext
    var viewModel: PatternStashViewModel
    @Bindable var router: PatternsRouter
    
    // TODO: fix routing/display for macOS
    var body: some View {
        NavigationSplitView {
            NavigationStack(path: $router.navigationPath) {
                List(viewModel.patterns) { pattern in
                    Button(pattern.name) { router.navigateTo(route: .detail(pattern: pattern)) }
                }.border(.blue)
                .navigationDestination(for: PatternsRouter.Route.self) { route in
                    switch route {
                    case .detail(let pattern):
                        PatternView(viewModel: PatternViewModel(pattern: pattern, modelContext: modelContext), router: router)
                    case .new:
                        PatternView(viewModel: PatternViewModel(pattern: nil, modelContext: modelContext), router: router)
                    }
                }
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
                ToolbarItem {
                    Button(action: { router.navigateTo(route: .new) }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a pattern")
        }
    }
}

#if DEBUG
//#Preview("PatternStashView") {
//    PatternStashView(viewModel: PatternStashViewModel(), router: PatternsRouter())
//}
#endif
