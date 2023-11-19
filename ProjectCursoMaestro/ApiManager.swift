//
//  ApiManager.swift
//  ProjectCursoMaestro
//
//  Created by Genaro Martinez on 19/11/23.
//

import Foundation

class ApiManager {
    static let API_BACKEND: String = "http://localhost:3000"
    
    static func get(
        endpoint: String,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        let fullUrl = "\(API_BACKEND)\(endpoint)"

        guard let url = URL(string: fullUrl) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let jwtToken = GlobalManager.shared.jwtToken {
           request.addValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }

        task.resume()
    }
    
    static func post(
        endpoint: String,
        params: [String: Any],
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        let fullUrl = "\(API_BACKEND)\(endpoint)"
        
        guard let url = URL(string: fullUrl) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let jwtToken = GlobalManager.shared.jwtToken {
           request.addValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        }

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params)
        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }

        task.resume()
    }
    
    static func put(
        endpoint: String,
        params: [String: Any],
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        let fullUrl = "\(API_BACKEND)\(endpoint)"

        guard let url = URL(string: fullUrl) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let jwtToken = GlobalManager.shared.jwtToken {
           request.addValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        }
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params)
        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }

        task.resume()
    }
    
    static func delete(
        endpoint: String,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        let fullUrl = "\(API_BACKEND)\(endpoint)"

        guard let url = URL(string: fullUrl) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        if let jwtToken = GlobalManager.shared.jwtToken {
            request.addValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }

        task.resume()
    }
}
