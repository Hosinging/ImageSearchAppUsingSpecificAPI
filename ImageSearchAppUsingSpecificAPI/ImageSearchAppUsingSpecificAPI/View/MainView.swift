//
//  ContentView.swift
//  ImageSearchAppUsingSpecificAPI
//
//  Created by Theo on 2022/04/07.
//

import SwiftUI
import Kingfisher

struct MainView: View {
    @EnvironmentObject private var vm: ViewModel
    @State private var searchText = ""
    @State private var isSearching = true
    
    let columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: .infinity)), count: 3)
    
    var body: some View {
        NavigationView {
            if vm.networkResult == false {
                withoutDataSearchView
                    .onTapGesture {
                        self.hideKeyboard()
                    }
                    .navigationTitle("이미지 검색")
            } else {
                withDataSearchView
                    .onTapGesture {
                        self.hideKeyboard()
                    }
                    .navigationTitle("이미지 검색")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewModel())
    }
}

extension MainView {
    private var imageGridView: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(vm.results, id: \.self) { result in
                NavigationLink {
                    DetailView(document: result)
                } label: {
                    VStack(alignment: .leading, spacing: 5) {
                        KFImage(URL(string: result.thumbnailUrl))
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                        Spacer()
                        Text((result.displaySiteName ?? "").isEmpty ? "출처불분명" : result.displaySiteName ?? "")
                            .font(.system(size: 14, weight: .bold))
                        Text(result.datetime?.adjustFormat() ?? "")
                            .font(.system(size: 12))
                        Spacer()
                    }
                    .onAppear {
                        fetchNextImages(document: result)
                    }
                    .padding()
                }
            }
        }
    }
    
    private var withDataSearchView: some View {
        ScrollView {
            CustomSearchBar
            imageGridView
            if vm.isLoading {
                CustomProgressView()
            }
        }
    }
    
    func fetchNextImages(document: Document) {
            if vm.results.last == document {
                vm.fetchNextPageImagesSubject.send(searchText)
            }
    }
    
    private var withoutDataSearchView: some View {
        ScrollView {
            VStack {
                CustomSearchBar
                Text(vm.noSearchResultText)
                    .padding(.top, 200)
            }
        }
    }
    
    private var CustomSearchBar: some View {
        HStack {
            TextField("검색어를 입력하세요.", text: $searchText)
                .padding(.leading, 25)
                .onChange(of: searchText) { newValue in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        vm.fetchData(queryString: newValue)
                    }
                }
        }
        .padding()
        .background(Color(white: 0, opacity: 0.05))
        .cornerRadius(10)
        .padding()
        .overlay(
            HStack {
                Image(systemName: "magnifyingglass")
                Spacer()
                Image(systemName: "xmark.circle.fill")
                    .opacity(searchText.isEmpty ? 0.0 : 1.0)
                    .onTapGesture {
                        searchText = ""
                        self.hideKeyboard()
                    }
            }
                .padding(.horizontal, 32)
        )
    }
}


