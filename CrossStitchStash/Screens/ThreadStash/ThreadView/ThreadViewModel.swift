//
//  ThreadViewModel.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI
import SwiftData

/**
 View model for `ThreadView`
 Optionally pass in a `Thread` object to edit an existing one, or create a new one
 */
@Observable class ThreadViewModel {
    private(set) var thread: Thread?
    var name: String
    var code: String
    var brand: String
    var lengthPerSkein: Double
    var skeinsInStash: Int
    var modelContext: ModelContext
    
    init(thread: Thread? = nil, modelContext: ModelContext) {
        self.thread = thread
        self.name = thread?.name ?? ""
        self.code = thread?.code ?? ""
        self.brand = thread?.brand ?? ""
        self.lengthPerSkein = thread?.lengthPerSkein ?? 0
        self.skeinsInStash = thread?.skeinsInStash ?? 0
        self.modelContext = modelContext
    }
    
    /**
     Calculate the amount of thread based on the length in a given color skein and the number of skeins in the stash
     */
    func calculateLengthInStash() -> Double {
        return lengthPerSkein * Double(skeinsInStash)
    }

    func saveChanges() -> Bool {
        do {
            let newThread = Thread(name: name, lengthPerSkein: lengthPerSkein, code: code, brand: brand, skeinsInStash: skeinsInStash)
            modelContext.insert(newThread)
            try modelContext.save()
            return true
        } catch {
            return false
        }
    }
}
