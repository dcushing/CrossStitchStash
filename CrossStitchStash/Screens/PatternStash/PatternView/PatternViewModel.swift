//
//  PatternViewModel.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI
import SwiftData

/**
 View model for PatternView
 Optionally pass in a `Pattern` object to edit an existing one, or create a new one
 */
@Observable final class PatternViewModel {
    private(set) var pattern: Pattern?
    var name: String
    var author: String
    var colors: [Thread]
    var status: PatternStatus
    var priority: PatternPriority?
    var modelContext: ModelContext
    
    init(pattern: Pattern? = nil, modelContext: ModelContext) {
        self.pattern = pattern
        self.name = pattern?.name ?? ""
        self.author = pattern?.author ?? ""
        self.colors = pattern?.colors ?? []
        self.status = pattern?.status ?? PatternStatus.backlog
        self.priority = pattern?.priority ?? PatternPriority.medium
        self.modelContext = modelContext
    }
    
    func saveChanges() -> Bool {
        do {
            let newPattern = Pattern(name: name, author: author, colors: colors, status: status, priority: priority)
            modelContext.insert(newPattern)
            try modelContext.save()
            return true
        } catch {
            return false
        }
    }

}

extension PatternStatus {
    var label: String {
        switch self {
        case .queued:
            return "Queued"
        case .inProgress:
            return "In progress"
        case .completed:
            return "Completed"
        case .backlog:
            return "Backlog"
        }
    }
}

extension PatternPriority {
    var label: String {
        switch self {
        case .high:
            return "High"
        case .medium:
            return "Medium"
        case .low:
            return "Low"
        }
    }
}
