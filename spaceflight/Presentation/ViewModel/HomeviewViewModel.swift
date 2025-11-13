//
//  HomeviewViewModel.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 13/11/25.
//

import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    // MARK: - Published States
    @Published var isLoading: Bool = false
    @Published var articles: [Article] = []
    @Published var blogs: [Blog] = []
    //@Published var reports: [Report] = []
    @Published var errorMessage: String?

    // MARK: - Dependencies
    private let articleRepository: ArticleRepository
    private let blogRepository: BlogRepository
    //private let reportRepository: ReportRepository

    // MARK: - Init
    init(
        articleRepository: ArticleRepository,
        blogRepository: BlogRepository,
        //reportRepository: ReportRepository
    ) {
        self.articleRepository = articleRepository
        self.blogRepository = blogRepository
        //self.reportRepository = reportRepository
    }

    // MARK: - Fetch All Data
    func loadHomeData() {
        Task {
            await fetchAll()
        }
    }

    // MARK: - Private Fetch Logic
    private func fetchAll() async {
        isLoading = true
        defer { isLoading = false }

        do {
            async let articlesTask = articleRepository.fetchArticles(limit: 5, offset: 0, ordering: "-published_at", titleContains: nil, newsSite: nil)
            async let blogsTask = blogRepository.fetchBlog(limit: 5, offset: 0, ordering: "-published_at", titleContains: nil, newsSite: nil)
            //async let reportsTask = reportRepository.fetchReport(limit: 5, offset: 0, ordering: "-published_at", titleContains: nil, newsSite: nil)

            //let (articlesResult, blogsResult, reportsResult) = try await (articlesTask, blogsTask, reportsTask)
            let (articlesResult, blogsResult) = try await (articlesTask, blogsTask)
            self.articles = articlesResult
            self.blogs = blogsResult
            //self.reports = reportsResult
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
