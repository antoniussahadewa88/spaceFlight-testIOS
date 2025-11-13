//
//  HomeView.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 12/11/25.
//

import Foundation
import SwiftUI
import Combine
import Swinject

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @EnvironmentObject var auth: AuthState
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading { ProgressView("Loading...") }
                else {
                    ReusableVStack {
                        ReusableText(text:greeting(),textColor:.black, fontSize: 18,fontWeight: .bold,paddingLeft: 16)
                        ReusableText(text:"Test Username",textColor:.gray, fontSize: 16,fontWeight: .semibold,isItalic: true,paddingBottom: 16,paddingLeft: 16)
                        
                        //this for view Artikel
                        ReusableHStack(paddingTop:16, paddingBottom:6, paddingLeft: 16, paddingRight: 16){
                            ReusableText(text:"Article",fontSize: 16,fontWeight: .bold)
                            Spacer()
                            NavigationLink(destination:
                                                        ArticleListView()
                                                            .environmentObject(DI.container.resolve(ArticleListViewModel.self)!)
                                                    ) {
                                                        ReusableText(
                                                            text:"See More",
                                                            textColor:.blue,
                                                            fontSize:16,
                                                            fontWeight:.bold,
                                                            isUnderline:true
                                                        )
                                                    }
                                                    .buttonStyle(.plain)
                        }
                        
                        ReusableHStack(spacing:8,paddingLeft: 8,paddingRight: 8) {
                            ForEach(viewModel.articles.prefix(3)) {
                                article in
                                CardView(fillColor:.white, borderColor:.gray,
                                                    borderWidth:1, spacing:1, height:150){
                                    if let img = article.imageUrl {
                                        AsyncImage(url: img) { content in
                                            content.resizable().aspectRatio(contentMode: .fill)
                                        } placeholder: {
                                            Color.gray
                                        }
                                        .frame(height: 70)
                                        .clipped()
                                        .cornerRadius(6)
                                        .padding(.horizontal,4)
                                        .padding(.top,4)
                                    }
                                    ReusableText(text:article.title, fontSize: 13, fontWeight: .semibold, maxLines: 1,
                                                 paddingTop: 4, paddingLeft: 4, paddingRight: 4)
                                    ReusableText(text:article.newsSite, isTextColorHex: true, textColorHex: "#9E9E9E",
                                                 fontSize: 11, fontWeight: .regular, maxLines:3, paddingLeft: 4,paddingRight: 4)
                                    Spacer()
                                }
                            }
                        }
                        
                        //this for view Blog
                        ReusableHStack(paddingTop:16, paddingBottom:1, paddingLeft: 16, paddingRight: 16){
                            ReusableText(text:"Blog",fontSize: 16,fontWeight: .bold)
                            Spacer()
                            ReusableText(text:"See More",textColor:.blue, fontSize: 16,fontWeight: .bold,isUnderline: true)
                        }
                        
                        ReusableHStack(spacing:8,paddingLeft: 8,paddingRight: 8) {
                            ForEach(viewModel.blogs.prefix(3)) {
                                blogs in
                                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
                                    if let img = blogs.imageUrl {
                                        AsyncImage(url: img) { content in
                                            content.resizable().aspectRatio(contentMode: .fill)
                                        } placeholder: {
                                            Color.gray
                                        }
                                        .frame(height: 70)
                                        .clipped()
                                        .cornerRadius(6)
                                        .padding(.horizontal,4)
                                        .padding(.top,4)
                                    }
                                    ReusableText(text:blogs.title, fontSize: 13, fontWeight: .semibold, maxLines: 1,
                                                 paddingTop: 4, paddingLeft: 4, paddingRight: 4)
                                    ReusableText(text:blogs.newsSite, isTextColorHex: true, textColorHex: "#9E9E9E",
                                                 fontSize: 11, fontWeight: .regular, maxLines:3, paddingLeft: 4,paddingRight: 4)
                                    Spacer()
                                }
                            }
                        }
                        
                        //this for view Report
//                        ReusableHStack(paddingTop:16, paddingBottom:1, paddingLeft: 16, paddingRight: 16){
//                            ReusableText(text:"Report",fontSize: 16,fontWeight: .bold)
//                            Spacer()
//                            ReusableText(text:"See More",textColor:.blue, fontSize: 16,fontWeight: .bold,isUnderline: true)
//                        }
                        
                        
            //            ReusableHStack(spacing:8,paddingLeft: 8,paddingRight: 8) {
            //                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
            //                    if let img = article.imageUrl {
            //                        AsyncImage(url: img) { content in
            //                            content.resizable().aspectRatio(contentMode: .fill)
            //                        } placeholder: {
            //                            Color.gray
            //                        }
            //                        .frame(height: 70)
            //                        .clipped()
            //                        .cornerRadius(6)
            //                        .padding(.horizontal,4)
            //                        .padding(.top,4)
            //                    }
            //                    ReusableText(text:article.title, fontSize: 13, fontWeight: .semibold, maxLines: 1,
            //                                 paddingTop: 4, paddingLeft: 4, paddingRight: 4)
            //                    ReusableText(text:article.newsSite, isTextColorHex: true, textColorHex: "#9E9E9E",
            //                                 fontSize: 11, fontWeight: .regular, maxLines:3, paddingLeft: 4,paddingRight: 4)
            //                    Spacer()
            //                }
            //
            //                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
            //                    if let img = article.imageUrl {
            //                        AsyncImage(url: img) { content in
            //                            content.resizable().aspectRatio(contentMode: .fill)
            //                        } placeholder: {
            //                            Color.gray
            //                        }
            //                        .frame(height: 70)
            //                        .clipped()
            //                        .cornerRadius(6)
            //                        .padding(.horizontal,4)
            //                        .padding(.top,4)
            //                    }
            //                    ReusableText(text:article.title, fontSize: 13, fontWeight: .semibold, maxLines: 1,
            //                                 paddingTop: 4, paddingLeft: 4, paddingRight: 4)
            //                    ReusableText(text:article.newsSite, isTextColorHex: true, textColorHex: "#9E9E9E",
            //                                 fontSize: 11, fontWeight: .regular, maxLines:3, paddingLeft: 4,paddingRight: 4)
            //                    Spacer()
            //                }
            //
            //                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
            //                    if let img = article.imageUrl {
            //                        AsyncImage(url: img) { content in
            //                            content.resizable().aspectRatio(contentMode: .fill)
            //                        } placeholder: {
            //                            Color.gray
            //                        }
            //                        .frame(height: 70)
            //                        .clipped()
            //                        .cornerRadius(6)
            //                        .padding(.horizontal,4)
            //                        .padding(.top,4)
            //                    }
            //                    ReusableText(text:article.title, fontSize: 13, fontWeight: .semibold, maxLines: 1,
            //                                 paddingTop: 4, paddingLeft: 4, paddingRight: 4)
            //                    ReusableText(text:article.newsSite, isTextColorHex: true, textColorHex: "#9E9E9E",
            //                                 fontSize: 11, fontWeight: .regular, maxLines:3, paddingLeft: 4,paddingRight: 4)
            //                    Spacer()
            //                }
            //            }
                        
                        Spacer()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Logout") { auth.logout() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Refresh") {
                        Task { await viewModel.loadHomeData() }
                    }
                }
            }
        }
        .task {
            print("HomeView .task running")
            await viewModel.loadHomeData()
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

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            articleRepository: MockArticleRepository(),
            blogRepository: MockBlogRepository()
        )
    )
    .environmentObject(AuthState.shared)
    .preferredColorScheme(.light)
}
