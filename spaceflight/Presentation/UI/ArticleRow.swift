//
//  ArticleRow.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import SwiftUI

struct ArticleRow: View {
    let article: Article

    var body: some View {
        HStack(alignment: .top) {
            if let img = article.imageUrl {
                AsyncImage(url: img) { content in
                    content.resizable().aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .frame(width: 100, height: 70).clipped().cornerRadius(6)
            }
            VStack(alignment: .leading, spacing: 6) {
                Text(article.title).font(.headline).lineLimit(2)
                Text(article.newsSite ?? "").font(.subheadline)
                if !article.launches.isEmpty {
                    Text("Launches: \(article.launches.map { $0.provider ?? "-" }.joined(separator: ", "))")
                        .font(.caption)
                }
            }
        }
    }
}

#Preview {
    ArticleRow(article: Article(
        id: 1,
        title: "Sample Title",
        url: URL(string: "https://example.com"),
        imageUrl: URL(string: "https://via.placeholder.com/150"),
        newsSite: "Spaceflight News",
        summary: "Sample summary for preview only",
        publishedAt: Date(),
        launches: [],
        events: []
    ))
}
