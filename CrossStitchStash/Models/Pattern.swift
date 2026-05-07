//
//  Pattern.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftData

enum PatternStatus: Int, Identifiable, CaseIterable, Codable {
    case queued, inProgress, completed, backlog
    var id: Int { return self.rawValue }
}

enum PatternPriority: Int, Identifiable, CaseIterable, Codable {
    case high, medium, low
    var id: Int { return self.rawValue }
}

/**
 Cross-stitch pattern
 */
@Model final class Pattern {
    private(set) var name: String // Name of the pattern (ex "Stars")
    private(set) var author: String? // Pattern author (ex "8pxl")
    private(set) var colors: [Thread] = [] // Colors used by pattern
    private(set) var status: PatternStatus // Status (queued, in progress, completed, backlog)
    private(set) var priority: PatternPriority? // optionally set the priority
    
    init(name: String, author: String? = nil, colors: [Thread], status: PatternStatus, priority: PatternPriority? = nil) {
        self.name = name
        self.author = author
        self.colors = colors
        self.status = status
        self.priority = priority
    }
}
