//
//  RootView.swift
//  DecomposableArchitecture
//
//  Created by Matej on 29. 10. 25.
//

import SwiftUI
import ComposableArchitecture

extension Onboarding {

    struct WelcomeView: View {
      let store: StoreOf<WelcomeViewFeature>

      var body: some View {
          VStack {
              Spacer()
              Text(store.title)
              Spacer()
          }
      }
    }
}
