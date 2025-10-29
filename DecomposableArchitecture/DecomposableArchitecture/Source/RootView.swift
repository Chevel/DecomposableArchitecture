//
//  RootView.swift
//  DecomposableArchitecture
//
//  Created by Matej on 29. 10. 25.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
  let store: StoreOf<RootViewFeature>

  var body: some View {
      VStack {
          Spacer()
          VStack(spacing: 8) {
              Text(store.title)
              Button("Number fact") { store.send(.startOnboardingButtonTapped) }
          }
          Spacer()
      }
  }
}
