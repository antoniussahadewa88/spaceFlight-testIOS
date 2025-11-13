//
//  HomeView.swift
//  spaceflight
//
//  Created by Antonius Krisna Sahadewa on 12/11/25.
//

import Foundation
import SwiftUI
import Combine

struct HomeView: View {
    let article: Article
    @State private var username: String = "Test Username"
    
    var body: some View {
        ReusableVStack {
            Text("Good Morning")
                .font(.title)
                .fontWeight(.bold)
            Text("Test Username")
                .font(.subheadline)
                .fontWeight(.semibold)
                .italic()
                .padding(.bottom,16)
            
            //this for view Artikel
            ReusableHStack(paddingTop:16, paddingBottom:6, paddingLeft: 16, paddingRight: 16){
                ReusableText(text:"Article",fontSize: 16,fontWeight: .bold)
                Spacer()
                ReusableText(text:"See More",textColor:.blue, fontSize: 16,fontWeight: .bold,isUnderline: true)
            }
            
            ReusableHStack(spacing:8,paddingLeft: 8,paddingRight: 8) {
                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
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
                
                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
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
                
                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
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
            
            //this for view Blog
            ReusableHStack(paddingTop:16, paddingBottom:1, paddingLeft: 16, paddingRight: 16){
                ReusableText(text:"Blog",fontSize: 16,fontWeight: .bold)
                Spacer()
                ReusableText(text:"See More",textColor:.blue, fontSize: 16,fontWeight: .bold,isUnderline: true)
            }
            
            ReusableHStack(spacing:8,paddingLeft: 8,paddingRight: 8) {
                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
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
                
                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
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
                
                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
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
            
            //this for view Report
            ReusableHStack(paddingTop:16, paddingBottom:1, paddingLeft: 16, paddingRight: 16){
                ReusableText(text:"Report",fontSize: 16,fontWeight: .bold)
                Spacer()
                ReusableText(text:"See More",textColor:.blue, fontSize: 16,fontWeight: .bold,isUnderline: true)
            }
            
            ReusableHStack(spacing:8,paddingLeft: 8,paddingRight: 8) {
                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
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
                
                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
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
                
                CardView(fillColor:.white, borderColor:.gray, borderWidth: 1, spacing:1, height:150){
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
            
            Spacer()
        }
    }
}

#Preview {
    HomeView(
        article: Article(
            id: 1,
            title: "Sample Title",
            url: URL(string: "https://example.com"),
            imageUrl: URL(string: "https://via.placeholder.com/150"),
            newsSite: "Spaceflight News",
            summary: "Sample summary for preview only",
            publishedAt: Date(),
            launches: [],
            events: []
        )
    )
    .preferredColorScheme(.light)
}
