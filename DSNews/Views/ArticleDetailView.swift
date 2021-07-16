//
//  ArticleDetailView.swift
//  ArticleDetailView
//
//  Created by Dmitry Seleznev on 7/16/21.
//

import SwiftUI

struct ArticleDetailView: View {
    
    let article: Article
    var body: some View {
        VStack {
            AsyncImage(url: article.imageURL) {
                phase in
                switch phase {
                case .empty:
                    HStack{
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                case .failure:
                    HStack {
                        Spacer()
                        Image(systemName: "photo")
                            .imageScale(.large)
                        Spacer()
                    }
                    
                @unknown default:
                    fatalError()
                }
            }
            .frame (maxWidth: 325, minHeight: 200, maxHeight: 300, alignment: .center)
            .background(Color.gray.opacity(0.3))
            .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(article.title)
                    .font(.headline)
                
                Text(article.contentText)
                    .font(.subheadline)
                
                HStack {
                    Text(article.caprionText)
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}


struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: .previewData[0])
    }
}
