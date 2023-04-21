//
//  FavoritePokemonsView.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/17.
//
//
import SwiftUI

struct FavoritePokemonsView: View {
    @EnvironmentObject var pokemonViewModel: PokemonData
    var body: some View {
        List {
            ForEach($pokemonViewModel.favoritePokemonList) { pokemon in
                ListRow(pokemon: pokemon)
            }
        }
    }
}

struct FavoritePokemonsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PokemonData())
    }
}
