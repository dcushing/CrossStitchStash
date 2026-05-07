//
//  ThreadViewModel.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI

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
    
    init(thread: Thread? = nil) {
        self.thread = thread
        self.name = thread?.name ?? ""
        self.code = thread?.code ?? ""
        self.brand = thread?.brand ?? ""
        self.lengthPerSkein = thread?.lengthPerSkein ?? 0
        self.skeinsInStash = thread?.skeinsInStash ?? 0
    }
    
    /**
     Calculate the amount of thread based on the length in a given color skein and the number of skeins in the stash
     */
    func calculateLengthInStash() -> Double {
        return lengthPerSkein * Double(skeinsInStash)
    }

    func saveChanges() {
        print("Saving changes to the thread (implementation TBD)")
    }
}
