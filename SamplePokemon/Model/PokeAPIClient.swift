//
//  PokeAPIClient.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/16.
//

import Foundation

class PokeAPIClient {
    
    func fetch(url: String) async throws -> Pokemon {
        guard let reqestURL = URL(string: url) else {
            throw APIError.invalidURL
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: reqestURL)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw APIError.responseError
            }
            guard let result = try? JSONDecoder().decode(Pokemon.self, from: data) else {
                throw APIError.decodeError
            }
            return result
        } catch {
            throw APIError.networkError
        }
    }
    
    //ポケモン151体分のリクエストURL作成メソッド
    func getURLs() -> [String] {
        let pokemonIdRange = 1...151
        let url: [String] = pokemonIdRange.map {
            "https://pokeapi.co/api/v2/pokemon/\($0)/"
        }
        return url
    }
}
