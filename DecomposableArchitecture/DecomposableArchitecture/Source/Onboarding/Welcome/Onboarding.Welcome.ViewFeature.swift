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
                    state.path.append(.step1(Onboarding.Step1ViewFeature.State()))
                    return .none

                case .path(.element(id: _, action: .step1(.nextPressed))):
                    state.path.append(.step2(Onboarding.Step2ViewFeature.State()))
                    return .none
                    
                case .path(.element(id: _, action: .step2(.nextPressed))):
                    return .send(.onboardingFinished)

                default:
                    return .none
                }
            }
            ._printChanges()
            .forEach(\.path, action: \.path)
        }
    }
}

// MARK: - State

extension Onboarding.WelcomeViewFeature {
    
    @ObservableState
    struct State {
        var title: String = "step 0"
        var path = StackState<Path.State>()
    }
}

// MARK: - Action

extension Onboarding.WelcomeViewFeature {

    @CasePathable
    enum Action {
        case nextPressed
        case path(StackActionOf<Path>)
        case onboardingFinished
    }
}
// MARK: - Path
 
extension Onboarding.WelcomeViewFeature {
    
    @Reducer
    enum Path {
        case step1(Onboarding.Step1ViewFeature)
        case step2(Onboarding.Step2ViewFeature)
    }
}
