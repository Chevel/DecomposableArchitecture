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
        Scope(state: \.onboarding, action: \.onboarding) {
            Onboarding.WelcomeViewFeature()
        }
        Reduce { state, action in
            switch action {
            case .startOnboardingButtonTapped:
                state.appState = .onboarding

            case .onboarding(.onboardingFinished):
                state.appState = .main
                state.onboarding = Onboarding.WelcomeViewFeature.State()
                
            default:
                return .none
            }
            return .none
        }
        ._printChanges()
    }
}

// MARK: - State

extension RootViewFeature {

    @ObservableState
    struct State {
        var title: String

        var onboarding = Onboarding.WelcomeViewFeature.State()
        var appState: AppState = .main
        
        @Reducer
        enum AppState {
            case main
            case onboarding
        }
    }
}

// MARK: - Action

extension RootViewFeature {

    @CasePathable
    enum Action {
        case startOnboardingButtonTapped
        case onboarding(Onboarding.WelcomeViewFeature.Action)
    }
}
