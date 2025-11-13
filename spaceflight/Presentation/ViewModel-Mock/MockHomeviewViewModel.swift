//
//  MockHomeviewViewModel.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 13/11/25.
//

class MockHomeViewModel: HomeViewModel {
    init() {
        super.init(
            articleRepository: MockArticleRepository(),
            blogRepository: MockBlogRepository(),
            //reportRepository: MockReportRepository()
        )
        self.articles = Article.mockArticles
        self.blogs = Blog.mockBlogs
        //self.reports = Report.mockReports
    }
}
