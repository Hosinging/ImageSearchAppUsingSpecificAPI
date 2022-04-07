//
//  ViewModel.swift
//  ImageSearchAppUsingSpecificAPI
//
//  Created by Theo on 2022/04/07.
//

import Foundation
import Combine
import Alamofire

class ViewModel: ObservableObject {
    @Published var results = [Document]()
    @Published var networkResult = true
    @Published var noSearchResultText = ""
    @Published var isEndInfo: Meta? 
    @Published var pageableCount: Int? {
        didSet {
            if pageableCount ?? 0 > 30 {
                currentPage += 1
            }
        }
    }
    @Published var isLoading: Bool = false
    @Published var currentPage = 1
    
    private let network = NetworkService(session: URLSession.shared)
    private var cancellables = Set<AnyCancellable>()
    var fetchNextPageImagesSubject = PassthroughSubject<String, Never>()
    
    init() {
        fetchNextPageImagesSubject
            .sink { [weak self] query in
                guard let self = self else { return }
                if self.isLoading == false {
                    self.fetchNextPageImages(query: query)
                }
            }
            .store(in: &cancellables)
    }
    
    func fetchNextPageImages(query: String) {
        self.isLoading = true
        guard let isEnd = isEndInfo?.isEnd,
        let pageableCount = pageableCount else { return }
        
        if isEnd == false, pageableCount > 30 {
            let nextPage = currentPage + 1
            AF.request(Router.getImages(query: query, page: nextPage))
                .publishDecodable(type: ImageSearchEntity.self)
                .compactMap { imageSearchEntity in
                    imageSearchEntity.value
                }
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        print("데이터 스트림 완료 실패: \(error)")
                    case .finished:
                        self.isLoading = false
                    }
                } receiveValue: { imageSerchEntity in
                    self.results += imageSerchEntity.documents
                    self.isEndInfo? = imageSerchEntity.meta
                }
                .store(in: &cancellables)
        }
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
                    } receiveValue: { imageSearchEntity in
                        DispatchQueue.main.async {
                            self.results = imageSearchEntity.documents
                            self.isEndInfo = imageSearchEntity.meta
                            self.pageableCount = imageSearchEntity.meta.pageableCount
                        }
                    }
                    .store(in: &cancellables)
            }
        } else {
            results.removeAll()
        }
        
    }
}
