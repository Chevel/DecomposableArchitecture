//
//  RootView.swift
//  DecomposableArchitecture
//
//  Created by Matej on 29. 10. 25.
//

import SwiftUI
import ComposableArchitecture

extension Onboarding {

    struct Step1View: View {
      let store: StoreOf<Step1ViewFeature>

      var body: some View {
          VStack {
              Spacer()
              Text(store.title)
              Spacer()
          }
      }
    }
}
