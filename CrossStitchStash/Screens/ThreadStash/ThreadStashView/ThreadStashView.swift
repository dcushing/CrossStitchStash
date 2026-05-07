//
//  ThreadStashView.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI
import SwiftData

struct ThreadStashView: View {
    var viewModel: ThreadStashViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.threads) { thread in
                Text(thread.code)
            }
        }
    }
}

#Preview {
    ThreadStashView(viewModel: ThreadStashViewModel())
}
