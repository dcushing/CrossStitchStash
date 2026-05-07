//
//  ThreadStashViewModel.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI
import SwiftData

@Observable final class ThreadStashViewModel {
    private(set) var threads: [Thread]
    var modelContext: ModelContext
    
    init(threads: [Thread] = [], modelContext: ModelContext) {
        self.threads = threads
        self.modelContext = modelContext
        fetchData()
    }
    
    func fetchData() {
        do {
            let descriptor = FetchDescriptor<Thread>(sortBy: [SortDescriptor(\.code)])
            threads = try modelContext.fetch(descriptor)
        } catch {
            print("\(String(describing: self)) failed to fetch threads")
        }
    }
}
