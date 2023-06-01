//
//  Network.swift
//  GestorEscolar
//
//  Created by Cáren Sousa on 27/05/23.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}



class Network {
    
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func fetchRequest <T: Decodable> (urlPath: String, httpMethod: HTTPMethods, queryItems: [URLQueryItem], completion: @escaping ((_ responseData: T?) -> Void)) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "camerascomputex.ddns.net"
        urlComponents.port = 8080
        urlComponents.path = urlPath
        urlComponents.queryItems = queryItems
        
                
        guard let url = urlComponents.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let response = response as? HTTPURLResponse else { return }
            print("STATUS CODE: \(response.statusCode) \(response.url?.absoluteString ?? "")")
            
            if let error = error {
                print("Erro ao buscar dados: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(T.self, from: data)
                completion(responseData)
                
            } catch {
                print("Erro ao decodificar os dados JSON: \(error)")
            }
        }
        
        task.resume()
    }
}
