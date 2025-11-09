//
//  spaceflightApp.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import SwiftUI
import Combine
import Swinject
import UserNotifications

@main
struct spaceflightApp: App {
    @StateObject private var authState = AuthState.shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(authState)
                .environmentObject(DI.container.resolve(ArticleListViewModel.self)!)
        }
    }
}

