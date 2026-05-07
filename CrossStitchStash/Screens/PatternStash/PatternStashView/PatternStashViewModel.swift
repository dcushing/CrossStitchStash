//
//  PatternStashViewModel.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI

@Observable final class PatternStashViewModel {
    private(set) var patterns: [Pattern]

    init(patterns: [Pattern] = []) {
        self.patterns = patterns
    }
}
