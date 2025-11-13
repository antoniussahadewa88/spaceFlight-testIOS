//
//  MainTabView.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import SwiftUI
import Swinject
import Combine

struct MainTabView: View {
    var body: some View {
        TabView {
//            ArticleListView()
//                .tabItem { Label("Articles", systemImage: "list.bullet") }
            HomeView(viewModel: DI.container.resolve(HomeViewModel.self)!)
                .tabItem { Label("Home", systemImage: "house.fill") }
            RecentSearchView()
                .environmentObject(DI.container.resolve(RecentSearchViewModel.self)!)
                .tabItem { Label("Recent", systemImage: "clock.arrow.circlepath") }
            Text("Reports – stub")
                .tabItem { Label("Reports", systemImage: "doc.text") }
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(AuthState.shared)
}
