//
//  FavoritePokemonData.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/16.
//

import Foundation

class FavoritePokemonData: ObservableObject {
    @Published var favoritePokemonList: [Pokemon] = []
    
    func addFavorit(pokemon: Pokemon) {
        favoritePokemonList.append(pokemon)
    }
}
