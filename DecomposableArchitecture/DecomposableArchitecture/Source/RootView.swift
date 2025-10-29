//
//  RootView.swift
//  DecomposableArchitecture
//
//  Created by Matej on 29. 10. 25.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {

    let store: StoreOf<RootViewFeature>
    
    var body: some View {
        switch store.appState {
        case .main:
            content

        case .onboarding:
            Onboarding.WelcomeView(
                store: Store(
                    initialState: Onboarding.WelcomeViewFeature.State(),
                    reducer: { Onboarding.WelcomeViewFeature() }
                )
            )
        }
    }
}

private extension RootView {
    
    var content: some View {
        VStack {
            Spacer()
            VStack(spacing: 8) {
                Text(store.title)
                Button("Number fact") { store.send(.startOnboardingButtonTapped) }
            }
            Spacer()
        }
    }
}
