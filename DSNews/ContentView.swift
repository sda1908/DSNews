//
//  ContentView.swift
//  DSNews
//
//  Created by Dmitry Seleznev on 7/16/21.
//

import SwiftUI

struct ContentView: View {

        @StateObject var articleNewsVM = ArticleNewsViewModel()
        
        var body: some View {
            NavigationView {
                ArticleListView(articles: articles)
                    .task(id: articleNewsVM.fetchTaskToken, loadTask)
                    .refreshable(action: refreshTask)
                    .navigationTitle(articleNewsVM.fetchTaskToken.category.text)
            }
        }
                
        private var articles: [Article] {
            if case let .success(articles) = articleNewsVM.phase {
                return articles
            } else {
                return []
            }
        }
        
        private func loadTask() async {
            await articleNewsVM.loadArticles()
        }
        
        private func refreshTask() {
            articleNewsVM.fetchTaskToken = FetchTaskToken(category: articleNewsVM.fetchTaskToken.category, token: Date())
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
