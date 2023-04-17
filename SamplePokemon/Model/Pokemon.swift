//
//  Pokemon.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/16.
//

import Foundation

//ポケモンのモデル
struct Pokemon: Decodable, Identifiable {
    let name: String
    let sprites: Sprites
    
    var id: String { name }
    
    //画像データ
    struct Sprites: Decodable {
        let frontImage: URL
        
        enum CodingKeys: String, CodingKey {
            case frontImage = "front_default"
        }
    }
}

struct PokemonJp: Decodable {
    let names: [Name]
    
    struct Name: Decodable {
        let name: String
    }
}
