//
//  PokemonData.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/16.
//

import Foundation

class PokemonData: ObservableObject {
    @Published var pokemonList: [CustomPokemon] = []
    @Published var favoritePokemonList: [CustomPokemon] = []
    private let pokeAPIclient = PokeAPIClient()
    @Published var isFavoriteView = false
    
    func loadPokemons() async {
        let pokemonIdRange = 1...151
        for num in pokemonIdRange {
            do {
                let pokemonEn = try await pokeAPIclient.fetch1(number: num)
                let pokemonJp = try await pokeAPIclient.fetch2(number: num)
                let customPokemon = CustomPokemon(
                    jaName: pokemonJp.names[0].name,
                    enName: pokemonEn.name,
                    image: pokemonEn.sprites.frontImage,
                    favorite: false
                )
                DispatchQueue.main.async {
                    self.pokemonList.append(customPokemon)
                }
            } catch {
                let error = error as? APIError ?? APIError.unknown
                print(error.title)
            }
        }
    }
    
    func didTapFavoritButton() {
        let favoritePokemons = pokemonList.filter({ $0.favorite })
        favoritePokemonList = favoritePokemons
    }
    
    func didTapFavoriteViewButton() {
        isFavoriteView = true
    }
}
