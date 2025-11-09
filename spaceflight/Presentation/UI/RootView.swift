//
//  RootView.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import SwiftUI
import Combine

struct RootView: View {
    @EnvironmentObject var auth: AuthState
    @EnvironmentObject var vm: ArticleListViewModel

    var body: some View {
        ZStack {
            if auth.isLoggedIn {
                MainTabView()
            } else {
                LoginView()
            }
        }
        .animation(.easeInOut, value: auth.isLoggedIn)
        .preferredColorScheme(.light)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            auth.restoreSessionIfNeeded()
            }
        }
    }
}
