//
//  PatternStashView.swift
//  CrossStitchStash
//
//  Created by Danielle Cushing1 on 5/7/26.
//

import SwiftUI

struct PatternStashView: View {
  var viewModel: PatternStashViewModel

  var body: some View {
    VStack {
      PatternStashViewDetailsView(viewModel: viewModel)
    }
  }
}

private struct PatternStashViewDetailsView: View {
var viewModel: PatternStashViewModel

  var body: some View {
      ForEach(viewModel.patterns) { pattern in
          Text(pattern.name)
      }
  }
}

#if DEBUG
#Preview("PatternStashView") {
    PatternStashView(viewModel: PatternStashViewModel())
}
#endif
