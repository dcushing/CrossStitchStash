//
//  PatternView.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI
import SwiftData

struct PatternView: View {
    @Environment(\.modelContext) private var modelContext
    var viewModel: PatternViewModel
    @Bindable var router: PatternsRouter
    
    var body: some View {
        PatternViewDetailsView(viewModel: viewModel)
            .navigationTitle(viewModel.pattern == nil ? "Add pattern" : "Edit pattern")
            .toolbar {
                ToolbarItem {
                    Button("Save") {
                        let saved = viewModel.saveChanges()
                        if saved {
                            router.navigationPath.removeLast()
                        }
                    }
                }
            }
    }
}

private struct PatternViewDetailsView: View {
  @Bindable var viewModel: PatternViewModel

  var body: some View {
      VStack {
          TextField("Name", text: $viewModel.name)
          TextField("Author", text: $viewModel.author)
          Picker("Status", selection: $viewModel.status) {
              ForEach(PatternStatus.allCases) { status in
                  Text(status.label)
              }
          }
          Picker("Priority", selection: $viewModel.priority) {
              ForEach(PatternPriority.allCases) { status in
                  Text(status.label)
              }
          }
      }
      .padding()
  }
}

//#if DEBUG
//#Preview("PatternView") {
//    PatternView(viewModel: PatternViewModel())
//}
//#endif
