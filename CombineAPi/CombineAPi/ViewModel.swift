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
    private var cancellabls = Set<AnyCancellable>()

    func getDatas(cityName: String){
       let data = Networking.shared.request(cityName: cityName)
        
        data
            .decode(type: Datas.self, decoder: JSONDecoder())
            .sink(receiveCompletion: {
                print ("Received completion: \($0).")
            },  receiveValue: {user in
                print ("Received user: \(user).")
            })
            .store(in: &cancellabls)
        
        
    }
}

