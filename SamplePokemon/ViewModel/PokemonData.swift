//
//  PokemonData.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/16.
//

import Foundation

class PokemonData: ObservableObject {
    @Published var PokemonList: [Pokemon] = []
    private let pokeAPIclient = PokeAPIClient()
    
    func onApper() async {
        let urls = pokeAPIclient.getURLs()
        
        for url in urls {
            do {
                let pokemon = try await pokeAPIclient.fetch(url: url)
                DispatchQueue.main.async {
                    self.PokemonList.append(pokemon)
                }
            } catch {
                let error = error as? APIError ?? APIError.unknown
                print(error.title)
            }
        }
    }
}
