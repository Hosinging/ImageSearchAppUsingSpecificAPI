//
//  Router.swift
//  ImageSearchAppUsingSpecificAPI
//
//  Created by Theo on 2022/04/07.
//

import Alamofire
import Foundation

enum Router: URLRequestConvertible {
    case getImages(query: String = "", page: Int = 1, size: Int = 30)
    
    var baseUrl: URL? {
        let url = URLBuilder()
            .set(scheme: "https")
            .set(host: "dapi.kakao.com")
            .set(path: "v2/search/image")
            .build()
        return url
    }
    
    var method: HTTPMethod {
        switch self {
        case .getImages: return .get
        @unknown default: return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .getImages(query: let query, page: let page, size: let size):
            var params = Parameters()
            params["query"] = query
            params["page"] = page
            params["size"] = size
            return params
        @unknown default: return Parameters()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = baseUrl else {
            throw NetworkError.failedBaseUrlOptionalBinding
        }
        var request = URLRequest(url: url)
        request.method = method
        request.allHTTPHeaderFields = [
            "Content-Type": "application/x-www-form-urlencoded;charset=utf-8",
            "Authorization": "KakaoAK d7cafb6f44d1ee9c4c9cd5fd6bdb0899"
        ]
        switch self {
        case .getImages:
            request = try URLEncoding.default.encode(request, with: parameters)
        @unknown default: return request
        }
        return request
        
    }
}
