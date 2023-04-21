//
//  Pokemon.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/16.
//

import Foundation

//ポケモンのモデル
struct Pokemon: Decodable {
    let name: String
    let sprites: Sprites

    //画像データ
    struct Sprites: Decodable {
        let frontImage: URL
        
        enum CodingKeys: String, CodingKey {
            case frontImage = "front_default"
        }
    }
}

struct PokemonJP: Decodable {
    let names: [Name]
    
    struct Name: Decodable {
        let name: String
    }
}

struct CustomPokemon: Identifiable, Codable {
    let nameJP: String
    let nameENG: String
    let image: URL
    var favorite: Bool
    
    var id: String { nameJP }
}
