//
//  ArticleDetailView.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 08/11/25.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                if let url = article.imageUrl {
                    AsyncImage(url: url) { img in
                        img.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray.frame(height: 200)
                    }
                }
                Text(article.title).font(.title2).padding(.top)
                if let date = article.publishedAt {
                    Text(formatted(date))
                        .font(.footnote).foregroundColor(.secondary)
                }
                if let summary = article.summary {
                    Text(firstSentence(from: summary))
                        .padding(.top, 8)
                }
                if !article.events.isEmpty {
                    Text("Events: \(article.events.map { $0.provider ?? "-" }.joined(separator: ", "))")
                }
                Spacer()
            }.padding()
        }.navigationTitle("Detail")
    }

    func formatted(_ d: Date) -> String {
        let df = DateFormatter()
        df.locale = Locale.current
        df.dateFormat = "d MMMM yyyy, HH:mm"
        return df.string(from: d)
    }

    func firstSentence(from s: String) -> String {
        if let idx = s.firstIndex(of: ".") {
            return String(s[..<idx]) + "."
        } else {
            return s
        }
    }
}
