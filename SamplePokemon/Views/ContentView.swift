//
//  ContentView.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/16.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pokemonViewModel = PokemonData()
    var body: some View {
        NavigationStack {
            List {
                ForEach(pokemonViewModel.pokemonList) { pokemon in
                    ListRow(pokemon: pokemon)
                }
            }
            .task {
                await pokemonViewModel.loadPokemons()
            }
            .navigationTitle("初代ポケモン")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        pokemonViewModel.didTapFavoriteViewButton()
                    }) {
                        HStack {
                            Image(systemName: "heart.fill")
                        }
                        .foregroundColor(.red)
                    }
                }
            }
        }
        .sheet(isPresented: $pokemonViewModel.isFavoriteView) {
            FavoritePokemonsView(pokemons: pokemonViewModel.favoritePokemonList)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
