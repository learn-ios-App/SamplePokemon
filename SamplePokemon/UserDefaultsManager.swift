//
//  UserDefaultsManager.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/21.
//

import Foundation

class UserDefaultsManager {
    private let userDefaults = UserDefaults.standard
    private var key = "Pokemons_Key"
    
    func save(pokemons: [CustomPokemon]) throws -> Void {
        do {
            let json = try encode(pokemons: pokemons)
            userDefaults.set(json, forKey: key)
        } catch {
            switch error as? DataConvertError ?? DataConvertError.unknown {
            case .encodingError:
                throw DataConvertError.encodingError
            case .dataCorrupted:
                throw DataConvertError.dataCorrupted
            default:
                throw DataConvertError.unknown
            }
        }
    }
    
    func load() throws -> [CustomPokemon] {
        guard let json = userDefaults.string(forKey: key) else {
            return []
        }
        do {
            let pokemons = try decode(json: json)
            return pokemons
        } catch {
            switch error as? DataConvertError ?? DataConvertError.unknown {
            case .decodingError:
                throw DataConvertError.decodingError
            case .dataCorrupted:
                throw DataConvertError.dataCorrupted
            default:
                throw DataConvertError.unknown
            }
            
        }
    }
    
    
    private func decode(json: String) throws -> [CustomPokemon] {
        do {
            guard let data = json.data(using: .utf8) else {
                throw DataConvertError.dataCorrupted
            }
            let pokemons = try JSONDecoder().decode([CustomPokemon].self, from: data)
            return pokemons
        } catch {
            throw DataConvertError.decodingError
        }
    }
    
    private func encode(pokemons: [CustomPokemon]) throws -> String {
        do {
            let data = try JSONEncoder().encode(pokemons)
            guard let json = String(data: data, encoding: .utf8) else {
                throw DataConvertError.dataCorrupted
            }
            return json
        } catch {
            throw DataConvertError.encodingError
        }
    }
}
