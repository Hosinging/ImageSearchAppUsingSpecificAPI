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
        ScrollView([.vertical]) {
            VStack {
                KFImage(URL(string: document.imageUrl))
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                
            }
        }
        .background(Color.black)
    }
}

