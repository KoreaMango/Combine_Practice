//
//  ViewModel.swift
//  CombineAPi
//
//  Created by 강민규 on 2022/09/08.
//

import Foundation
import Combine

final class ViewModel : ObservableObject {
    @Published var datas : [Datas] = []
    
    private var cancellable :AnyCancellable?
    
    
    func getData(cityName : String ) {
        let url = Parsing.shared.parsingURL(cityName: cityName )
        
        cancellable = URLSession.shared
                .dataTaskPublisher(for: url)
                .tryMap() { element -> Data in
                    guard let httpResponse = element.response as? HTTPURLResponse,
                        httpResponse.statusCode == 200 else {
                            throw URLError(.badServerResponse)
                        }
                    return element.data
                    }
                .decode(type: Datas.self, decoder: JSONDecoder())
                .sink(receiveCompletion: { print ("Received completion: \($0).") },
                      receiveValue: { user in print ("Received user: \(user).")})
    }
   
}
