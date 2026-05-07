//
//  Thread.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftData

/**
 Thread model to track color and amount in stash
 */
@Model final class Thread {
    private(set) var name: String? // ex "Medium plum floss"
    private(set) var lengthPerSkein: Double // ex 8.7
    private(set) var code: String // ex "917"
    private(set) var brand: String? // ex "DMC"
    private(set) var skeinsInStash: Int // the number of skeins in the stash
    @Relationship(inverse: \Pattern.colors) private(set) var patterns: [Pattern]
    
    init(name: String? = nil, lengthPerSkein: Double, code: String, brand: String? = nil, skeinsInStash: Int, patterns: [Pattern] = []) {
        self.name = name
        self.lengthPerSkein = lengthPerSkein
        self.code = code
        self.brand = brand
        self.skeinsInStash = skeinsInStash
        self.patterns = patterns
    }
    
    static func new() -> Thread {
        return Thread(lengthPerSkein: 0, code: "", skeinsInStash: 0)
    }
}
