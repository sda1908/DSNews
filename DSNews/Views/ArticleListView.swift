//
//  ArticleListView.swift
//  ArticleListView
//
//  Created by Dmitry Seleznev on 7/16/21.
//

import SwiftUI

struct ArticleListView: View {
    
    let articles: [Article]
    
    var body: some View {
            List{
                ForEach (articles) {article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        ArticleRowView(article: article)
                    }
                }
            }
            .listStyle(.plain)
        }
    }

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(articles: Article.previewData)
    }
}
