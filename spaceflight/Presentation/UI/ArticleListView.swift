//
//  ArticleListView.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import SwiftUI
import Combine

//ini sementara dijadikan salah satu bagian maintabview karenawaktu mendesak.
//untuk tab utama ada di HomeView(artikel,blog,report) yang perkomponennya
//sedang di selesaikan
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
            .task {
                if vm.articles.isEmpty {
                    await vm.fetchAll()
                }
            }
        }
    }
}

#Preview {
    ArticleListView()
        .environmentObject(MockArticleListViewModel())
        .preferredColorScheme(.light)
}
