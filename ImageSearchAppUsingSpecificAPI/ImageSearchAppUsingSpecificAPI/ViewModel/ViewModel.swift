//
//  ViewModel.swift
//  ImageSearchAppUsingSpecificAPI
//
//  Created by Theo on 2022/04/07.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var items = 0..<5
    @Published var results = [Document]()
    @Published var networkResult = true
    @Published var noSearchResultText = ""
    
    private let network = NetworkService(session: URLSession.shared)
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
    }
    
    func fetchData(queryString: String, size: Int = 30, page: Int = 1) {
        if queryString.count > 0 {
            do {
                let optionalUrl = URLBuilder()
                    .set(scheme: "https")
                    .set(host: "dapi.kakao.com")
                    .set(path: "v2/search/image")
                    .addQueryItems([
                        "query": queryString,
                        "size": "\(size)",
                        "page": "\(page)"
                    ])
                    .build()
                guard let url = optionalUrl else { return }
                
                var request = URLRequest(url: url)
                request.allHTTPHeaderFields = [
                    "Content-Type": "application/x-www-form-urlencoded;charset=utf-8",
                    "Authorization": "KakaoAK d7cafb6f44d1ee9c4c9cd5fd6bdb0899"
                ]
                request.httpMethod = "GET"
                
                network.requst(request: request)
                    .sink { result in
                        switch result {
                        case .failure(let networkError):
                            print("네트워크 에러 발생", networkError.localizedDescription)
                            DispatchQueue.main.async {
                                self.networkResult = false
                                self.noSearchResultText = "검색 결과가 없습니다."
                            }
                            
                        case .finished:
                            print("Success")
                            DispatchQueue.main.async {
                                self.networkResult = true
                            }
                        }
                    } receiveValue: { documents in
                        DispatchQueue.main.async {
                            self.results = documents
                        }
                    }
                    .store(in: &cancellables)
            }
        } else {
            results.removeAll()
        }
        
    }
}
