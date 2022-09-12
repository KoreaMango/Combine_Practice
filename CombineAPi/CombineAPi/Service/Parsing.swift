//
//  Service.swift
//  CombineAPi
//
//  Created by 강민규 on 2022/09/08.
//

import Foundation
import Combine
// https://api.openweathermap.org/data/2.5/weather?q=Busan&appid=7d44cd3f14e73a7ec226c506bb668083
struct Parsing {
    static let shared = Parsing()
    
    public let apiKey = "7d44cd3f14e73a7ec226c506bb668083"
    public let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    public let imageQ = "/img/w/"

    let countries : [String] = [ "GongJu", "GwangJu", "Gumi", "Gunsan", "Daegu", "Daejeon", "Mokpo", "Busan", "Seosan", "Seoul", "Sokcho", "Suwon", "Suncheon", "Ulsan", "Iksan", "Jeonju", "Jeju", "Cheonan", "Cheongju", "Chuncheon" ]
    let countriesKR : [String] = [ "공주", "광주(전라남도)", "구미", "군산", "대구", "대전", "목포", "부산", "서산", "서울", "속초", "수원", "순천", "울산", "익산", "전주", "제주시", "천안", "청주", "춘천" ]

    
    func parsingURL(cityName: String) -> URL{
        // base가 될 URL로 시작.
        var components = URLComponents(string: baseURL)
        let query = URLQueryItem(name: "q", value: "\(cityName)")
        let appID = URLQueryItem(name: "appid", value: "\(apiKey)")
        
        components?.queryItems = [query, appID]
        
        let resultURL = components?.url
        
        return resultURL!
    }
    
    
 
}

