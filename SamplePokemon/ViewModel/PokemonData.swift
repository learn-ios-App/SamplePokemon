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
    @Published var isFavoriteView = false
    private let pokeAPIclient = PokeAPIClient()
    
    func loadPokemons() async {
        let pokemonIdRange = 1...151
        for num in pokemonIdRange {
            do {
                let pokeENG = try await pokeAPIclient.fetch1(number: num)
                let pokeJP = try await pokeAPIclient.fetch2(number: num)
                let customPokemon = CustomPokemon(
                    nameJP: pokeJP.names[0].name,
                    nameENG: pokeENG.name,
                    image: pokeENG.sprites.frontImage,
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
    
    //お気に入り画面に遷移するボタン
    func didTapFavoriteViewButton() {
        isFavoriteView = true
    }
    
    func didTapFavoritButton(pokemon: CustomPokemon) {
        guard let index = pokemonList.firstIndex(where: { $0.id == pokemon.id }) else {
            return
        }
        
        self.pokemonList[index].favorite.toggle()
        update()
    }
    
    func onApper() {
        let userDefaultsManager = UserDefaultsManager()
        do {
            let savedPokemons = try userDefaultsManager.load()
            favoritePokemonList = savedPokemons
        } catch {
            let error = error as? DataConvertError ?? DataConvertError.unknown
            print(error.title)
        }
    }
    
    private func save() {
        let userDefaultsManager = UserDefaultsManager()
        do {
            try userDefaultsManager.save(pokemons: favoritePokemonList)
        } catch {
            let error = error as? DataConvertError ?? DataConvertError.unknown
            print(error.title)
        }
    }
    
    private func update() {
        let favoritePokemons = self.pokemonList.filter({ $0.favorite })
        favoritePokemonList = favoritePokemons
    }
}
