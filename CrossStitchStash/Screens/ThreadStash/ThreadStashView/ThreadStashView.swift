//
//  ThreadStashView.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI
import SwiftData

struct ThreadStashView: View {
    @Environment(\.modelContext) private var modelContext
    var viewModel: ThreadStashViewModel
    @Bindable var router: ThreadsRouter
    
    var body: some View {
        NavigationSplitView {
            // TODO: fix routing/display for macOS
            NavigationStack(path: $router.navigationPath) {
                List(viewModel.threads) { thread in
                    Button(thread.code) { router.navigateTo(route: .detail(thread: thread)) }
                }.border(.blue)
                .navigationDestination(for: ThreadsRouter.Route.self) { route in
                    switch route {
                    case .detail(let thread):
                        ThreadView(viewModel: ThreadViewModel(thread: thread, modelContext: modelContext), router: router)
                    case .new:
                        ThreadView(viewModel: ThreadViewModel(thread: nil, modelContext: modelContext), router: router)
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
            Text("Pick a thread")
        }
    }
}

//#Preview {
//    ThreadStashView(viewModel: ThreadStashViewModel(), router: ThreadsRouter())
//}
