//
//  RootView.swift
//  DecomposableArchitecture
//
//  Created by Matej on 29. 10. 25.
//

import SwiftUI
import ComposableArchitecture

extension Onboarding {

    @Reducer
    struct Step2ViewFeature {

        var body: some Reducer<State, Action> {
            Reduce { state, action in
                switch action {
                case .nextPressed:
                    return .none
                }
            }
        }
    }
}

// MARK: - State

extension Onboarding.Step2ViewFeature {
    
    @ObservableState
    struct State: Equatable {
        var title: String = "step 2"
    }
}

// MARK: - Action

extension Onboarding.Step2ViewFeature {

    enum Action {
      case nextPressed
    }
}
