//
//  NetworkManager.swift
//  Leansquad_test
//
//  Created by Andrew Matsota on 21.01.2021.
//

import Foundation

//MARK: - Protocol
protocol NetworkManagment {
    
    func login(request model: LoginRequest,
               success: @escaping(LoginResponse) -> Void,
               failure: @escaping(String) -> Void)
    
}









//MARK: - Class
class NetworkManager {
    
    private let localError = LocalError.self
    private let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }

}









//MARK: - Protocol execution
extension NetworkManager: NetworkManagment {
    
    func login(request model: LoginRequest,
               success: @escaping (LoginResponse) -> Void,
               failure: @escaping (String) -> Void) {
        guard let data = try? encodeToJSONData(model) else {return}
        networking.post(api: .login, body: data) { (response) in
            do {
                let json = try JSONSerialization.jsonObject(with: response, options: [])
                guard let dictionary = json as? [String : Any] else {return}
                let result = LoginResponse(from: dictionary)
                print("dasdasdasdas", dictionary)
                success(result)
            } catch {
                failure(error.localizedDescription)
            }
        } failure: { (error) in
            failure(error.localizedDescription)
        }
    }
    
}









//MARK: - Private method
private extension NetworkManager {
    
    ///  - `encode` model to Data of JSON type
    func encodeToJSONData<T>(_ value: T) throws -> Data? where T: Encodable {
        guard let jsonData = try? JSONEncoder().encode(value) else {
            debugPrint("ERROR: json model prepared for HTTPBody can't be reached")
            return nil
        }
        return jsonData
    }
    
}
