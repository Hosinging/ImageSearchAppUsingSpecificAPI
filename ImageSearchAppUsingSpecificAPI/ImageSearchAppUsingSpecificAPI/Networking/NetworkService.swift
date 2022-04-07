//
//  NetworkService.swift
//  ImageSearchAppUsingSpecificAPI
//
//  Created by Theo on 2022/04/07.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidRequest
    case badResponse
    case unknownError(message: String)
    case failedBaseUrlOptionalBinding
}

class NetworkService {
    private let session: URLSession
    private let successResponseStatus = 200...299
    init(session: URLSession) {
        self.session = session
    }
    
    func requst(request: URLRequest) -> AnyPublisher<ImageSearchEntity, NetworkError> {
        return session.dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) -> ImageSearchEntity in
                guard let httpResponse = response as? HTTPURLResponse,
                      self.successResponseStatus.contains(httpResponse.statusCode) else {
                    throw NetworkError.invalidRequest
                }
                let imageSearchEntity = try JSONDecoder().decode(ImageSearchEntity.self, from: data)
                return imageSearchEntity
            }
            .mapError { error -> NetworkError in
                    .unknownError(message: "알수 없는 에러 발생: \(error)")
            }
            .eraseToAnyPublisher()
    }
    deinit {
        session.invalidateAndCancel()
    }
}
