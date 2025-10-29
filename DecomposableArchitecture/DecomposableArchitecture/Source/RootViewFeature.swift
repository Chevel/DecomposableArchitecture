//
//  RootView.swift
//  DecomposableArchitecture
//
//  Created by Matej on 29. 10. 25.
//

import ComposableArchitecture

@Reducer
struct RootViewFeature {

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .startOnboardingButtonTapped:
                return .none
            }
        }
    }
}

// MARK: - State

extension RootViewFeature {
    
    @ObservableState
    struct State: Equatable {
        var title: String
    }
}

// MARK: - Action

extension RootViewFeature {

    enum Action {
      case startOnboardingButtonTapped
    }
}
