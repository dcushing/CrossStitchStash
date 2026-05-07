//
//  PatternViewModel.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI

/**
 View model for PatternView
 Optionally pass in a `Pattern` object to edit an existing one, or create a new one
 */
@Observable final class PatternViewModel {
    private(set) var pattern: Pattern?
    var name: String
    var author: String
    var status: PatternStatus
    var priority: PatternPriority?
    
    init(pattern: Pattern? = nil) {
        self.pattern = pattern
        self.name = pattern?.name ?? ""
        self.author = pattern?.author ?? ""
        self.status = pattern?.status ?? PatternStatus.backlog
        self.priority = pattern?.priority
    }
    
    func saveChanges() {
        print("Saving changes to the pattern (implementation TBD)")
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
