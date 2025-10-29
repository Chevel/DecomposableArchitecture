//
//  RootView.swift
//  DecomposableArchitecture
//
//  Created by Matej on 29. 10. 25.
//

import SwiftUI
import ComposableArchitecture

extension Onboarding {

    struct Step2View: View {
      let store: StoreOf<Step2ViewFeature>

      var body: some View {
          VStack {
              Spacer()
              Text(store.title)
              Button("NEXT") { store.send(.nextPressed) }
              Spacer()
          }
      }
    }
}
