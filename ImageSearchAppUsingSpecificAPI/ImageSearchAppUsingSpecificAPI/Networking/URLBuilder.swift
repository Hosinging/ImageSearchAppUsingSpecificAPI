//
//  URLBuilder.swift
//  ImageSearchAppUsingSpecificAPI
//
//  Created by Theo on 2022/04/07.
//

import Foundation

class URLBuilder {
    private var components: URLComponents = URLComponents()
    
    func set(scheme: String) -> URLBuilder {
        self.components.scheme = scheme
        return self
    }
    
    func set(host: String) -> URLBuilder {
        self.components.host = host
        return self
    }
    
    func set(port: Int) -> URLBuilder {
        self.components.port = port
        return self
    }
    
    func set(path: String) -> URLBuilder {
        var path = path
        if !path.hasPrefix("/") {
            path = "/" + path
        }
        self.components.path = path
        return self
    }
    
    func addQueryItems(_ items: [String: String]) -> URLBuilder {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        for (key, value) in items {
            self.components.queryItems?.append(URLQueryItem(name: key, value: value))
        }
        return self
    }
    
    func addQurtyItem(_ item: URLQueryItem) -> URLBuilder {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        self.components.queryItems?.append(URLQueryItem(name: item.name, value: item.value))
        return self
    }
    
    func build() -> URL? {
        return self.components.url
    }
}
