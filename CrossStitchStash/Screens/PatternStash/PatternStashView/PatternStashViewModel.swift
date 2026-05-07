//
//  PatternStashViewModel.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI
import SwiftData

@Observable final class PatternStashViewModel {
    var modelContext: ModelContext
    private(set) var patterns: [Pattern]

    init(patterns: [Pattern] = [], modelContext: ModelContext) {
        self.modelContext = modelContext
        self.patterns = patterns
        fetchData()
    }

    func fetchData() {
        do {
            let descriptor = FetchDescriptor<Pattern>(sortBy: [SortDescriptor(\.name)])
            patterns = try modelContext.fetch(descriptor)
        } catch {
            print("\(String(describing: self)) failed to fetch threads")
        }
    }
}
