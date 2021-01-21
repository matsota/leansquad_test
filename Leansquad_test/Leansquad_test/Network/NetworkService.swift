//
//  NetworkService.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import Foundation
import Alamofire

//MARK: - Protocol
protocol Networking {
    
    func post(api method: API,
              body data: Data,
              success: @escaping(Data) -> Void,
              failure: @escaping(Error) -> Void)
    
}









//MARK: - Class
class NetworkService {
    
    //MARK: - Implementation
    private let tokenKey = "X-Access-Token"
    
}









//MARK: - Protocoling
extension NetworkService: Networking {
    
    func post(api method: API,
              body data: Data,
              success: @escaping(Data) -> Void,
              failure: @escaping(Error) -> Void) {
        guard let url = self.url(from: method) else {return}
        let body: ParameterEncoding = HTTPBody(from: data)
        
        AF.request(url, method: .post, parameters: nil, encoding: body, headers: nil, interceptor: nil).responseData { (response) in
            switch response.result {
            case .success(let data): success(data)
            case .failure(let error): failure(error)
            }
        }
    }
    
}









//MARK: - Private method
private extension NetworkService {
    
    /// - Create `URL` for requests
    func url(from method: API, _ parameters: [String: Any]? = nil) -> URL? {
        var components = URLComponents()
        components.scheme = API.scheme.rawValue
        components.host = API.host.rawValue
        components.path = method.rawValue
        
        if let dict = parameters {
            var queryItems = [URLQueryItem]()
            for (value, key) in dict {
                queryItems.append(URLQueryItem(name: value, value: "\(key)"))
            }
            components.queryItems = queryItems
        }
        return components.url
    }
    
}

struct HTTPBody: ParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        urlRequest.httpBody = data
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
    
    init(from data: Data) {
        self.data = data
    }
    
    private let data: Data
}
