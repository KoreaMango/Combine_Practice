//
//  ViewModel.swift
//  CombineAPi
//
//  Created by 강민규 on 2022/09/08.
//

import Foundation
import Combine

class ViewModel : ObservableObject {
    
    private var task: AnyCancellable?
    
    @Published var datas : [Datas] = []
    
//    func fetchDatas() {
//        task = URLSession.shared.dataTaskPublisher(for: <#T##URL#>)
//    }
    
    func getData(cityName : String) {
        let url = Parsing.shared.parsingURL(cityName: cityName)
        print(url)
     }
}
