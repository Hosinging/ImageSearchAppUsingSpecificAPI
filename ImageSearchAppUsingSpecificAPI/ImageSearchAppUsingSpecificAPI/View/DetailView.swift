//
//  DetailView.swift
//  ImageSearchAppUsingSpecificAPI
//
//  Created by Theo on 2022/04/07.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    let document: Document
    
    var body: some View {
        CustomImageView
    }
}

extension DetailView {
    private var CustomImageView: some View {
        ScrollView([.vertical]) {
                KFImage(URL(string: document.imageUrl))
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(alignment: .bottom, content: {
                        if document.displaySiteName != nil, document.datetime != nil {
                            VStack {
                                Text(document.displaySiteName ?? "")
                                Text(document.datetime?.adjustFormat() ?? "")
                            }
                            .font(.system(size: 20, weight: .bold))
                            .padding()
                            .foregroundColor(Color.green)
                        }
                    })
                    .aspectRatio(contentMode: .fill)
        }
        .background(Color.black)
    }
    
}

