//
//  PokeAPIClient.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/16.
//

import Foundation

class PokeAPIClient {
    
    func fetch1(number: Int) async throws -> Pokemon {
        guard let reqestURL = URL(string: "https://pokeapi.co/api/v2/pokemon/\(number)/") else {
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
    
    func fetch2(number: Int) async throws -> PokemonJP {
        guard let reqestURL = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(number)/") else {
            throw APIError.invalidURL
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: reqestURL)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw APIError.responseError
            }
            guard let result = try? JSONDecoder().decode(PokemonJP.self, from: data) else {
                throw APIError.decodeError
            }
            return result
        } catch {
            throw APIError.networkError
        }
    }
}
