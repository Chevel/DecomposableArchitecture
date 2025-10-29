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
    struct WelcomeViewFeature {

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

extension Onboarding.WelcomeViewFeature {
    
    @ObservableState
    struct State: Equatable {
        var title: String = "step 0"
    }
}

// MARK: - Action

extension Onboarding.WelcomeViewFeature {

    enum Action {
      case nextPressed
    }
}
