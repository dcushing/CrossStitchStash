//
//  ThreadView.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI

struct ThreadView: View {
  var viewModel: ThreadViewModel

  var body: some View {
    ThreadViewDetailsView(viewModel: viewModel)
          .navigationTitle(viewModel.thread == nil ? "Add thread" : "Edit thread")
  }
}

private struct ThreadViewDetailsView: View {
  @Bindable var viewModel: ThreadViewModel

  var body: some View {
      VStack {
          TextField("Name", text: $viewModel.name)
          TextField("Code", text: $viewModel.code)
          TextField("Brand", text: $viewModel.brand)
          TextField("Length per skein", value: $viewModel.lengthPerSkein, format: .number)
          TextField("Skeins in stash",  value: $viewModel.skeinsInStash, format: .number)
      }
  }
}

#if DEBUG
#Preview("ThreadView") {
    ThreadView(viewModel: ThreadViewModel())
}
#endif
