//
//  Model.swift
//  MAS_Programming1
//
//  Created by Jasleen Sidhu on 9/12/23.
//

import Foundation

// https://dog.ceo/dog-api/documentation/random

struct BreedResponse: Codable {
    var message: [String: [String]]
    var status: String
}

struct SingleImageResponse: Codable {
    var message: String
    var status: String
}

enum UrlError: Error {
    case badUrl
}


func getData<T: Codable>(urlString: String) async throws -> T  {
    guard let url = URL(string: urlString) else {
        throw UrlError.badUrl
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode(T.self, from: data)
}
