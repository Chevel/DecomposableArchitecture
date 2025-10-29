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
    struct Step1ViewFeature {

        var body: some Reducer<State, Action> {
            Reduce { state, action in
                switch action {
                case .nextPressed:
                    return .none
                }
            }
            ._printChanges()
        }
    }
}

// MARK: - State

extension Onboarding.Step1ViewFeature {
    
    @ObservableState
    struct State {
        var title: String = "step 1"
    }
}

// MARK: - Action

extension Onboarding.Step1ViewFeature {

    enum Action {
      case nextPressed
    }
}
