//
//  Networking.swift
//  CombineAPi
//
//  Created by 강민규 on 2022/09/14.
//

import Foundation
import Combine

struct Networking{
    static let shared = Networking()
    
    func request(cityName : String ) -> AnyPublisher<Data, NetworkError>{
        let url = Parsing.shared.parsingURL(cityName: cityName )
        
        return URLSession.shared
                .dataTaskPublisher(for: url)
                .tryMap() { data, response -> Data in
                    guard let httpResponse = response as? HTTPURLResponse,
                        httpResponse.statusCode == 200 else {
                            throw URLError(.badServerResponse)
                        }
                        return data
                    }
                .mapError({ error -> NetworkError in
                        .unknownError(message: error.localizedDescription)
                })
                .eraseToAnyPublisher()
    }
    
}
