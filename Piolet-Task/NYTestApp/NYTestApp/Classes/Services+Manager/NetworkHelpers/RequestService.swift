//
//  RequestService.swift
//  NYTestApp
//
//  Created by Apple Developer on 29/11/21.
//  Copyright © 2021 Apple Developer. All rights reserved.
//

import Foundation
import Reachability

final class RequestService {
    
    func loadData(urlString: String, session: URLSession = URLSession(configuration: .default), completion: @escaping (Result<Data, ErrorResult>) -> Void) -> URLSessionTask? {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.network(string: "Wrong url format")))
            return nil
        }
        
        var request = RequestFactory.request(method: .GET, url: url)
        
        if let reachability = try? Reachability(), reachability.connection == .unavailable {
            request.cachePolicy = .returnCacheDataDontLoad
        }
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.network(string: kNetworkErrorMessgae + error.localizedDescription)))
                return
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
        return task
    }
}
