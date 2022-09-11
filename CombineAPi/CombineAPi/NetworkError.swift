//
//  NetworkError.swift
//  CombineAPi
//
//  Created by 강민규 on 2022/09/11.
//

import Foundation

enum NetworkError: Error {
    case invalidRequest
    case unknownError(message: String)
}
