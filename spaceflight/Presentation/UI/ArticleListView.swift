//
//  ArticleListView.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import SwiftUI
import Combine

struct ArticleListView: View {
    @EnvironmentObject var vm: ArticleListViewModel
    @EnvironmentObject var auth: AuthState

    var body: some View {
        NavigationView {
            Group {
                if vm.isLoading { ProgressView("Loading...") }
                else {
                    List(vm.articles) { a in
                        NavigationLink(destination: ArticleDetailView(article: a)) {
                            ArticleRow(article: a)
                        }
                    }
                }
            }
            .navigationTitle(greeting())
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Logout") { auth.logout() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Refresh") {
                        Task { await vm.fetchAll() }
                    }
                }
            }
            .task {
                if vm.articles.isEmpty {
                    await vm.fetchAll()
                }
            }
        }
    }

    func greeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12: return "Good morning"
        case 12..<17: return "Good afternoon"
        case 17..<21: return "Good evening"
        default: return "Good night"
        }
    }
}
