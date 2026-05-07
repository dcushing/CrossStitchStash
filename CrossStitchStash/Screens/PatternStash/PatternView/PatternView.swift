//
//  PatternView.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI

struct PatternView: View {
  var viewModel: PatternViewModel

    var body: some View {
        PatternViewDetailsView(viewModel: viewModel)
            .navigationTitle(viewModel.pattern == nil ? "Add pattern" : "Edit pattern")
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
  }
}

#if DEBUG
#Preview("PatternView") {
    PatternView(viewModel: PatternViewModel())
}
#endif
