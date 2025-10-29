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
        
        @Bindable var store: StoreOf<WelcomeViewFeature>
        
        var body: some View {
            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                // Root view of the navigation stack
                content
            } destination: { store in
                // A view for each case of the Path.State enum
                switch store.case {
                case .step1(let store): Onboarding.Step1View(store: store)
                case .step2(let store): Onboarding.Step2View(store: store)
                }
            }
        }
    }
}

private extension Onboarding.WelcomeView {
    
    var content: some View {
        VStack {
            Spacer()
            Text(store.title)
            Button("NEXT") { store.send(.nextPressed) }
            Spacer()
        }
    }
}
