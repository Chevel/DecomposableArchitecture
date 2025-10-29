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
                state.appState = .onboarding
                state.onboarding = Onboarding.WelcomeViewFeature.State()

            case .onboarding(.onboardingFinished):
                state.appState = .main
                state.onboarding = nil
                
            default:
                return .none
            }
            return .none
        }
        ._printChanges()
        .ifLet(\.onboarding, action: \.onboarding) {
            Onboarding.WelcomeViewFeature()
        }
    }
}

// MARK: - State

extension RootViewFeature {

    @ObservableState
    struct State {
        var title: String
        var onboarding: Onboarding.WelcomeViewFeature.State?

        var appState: AppState = .main
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
