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
                ForEach(pokemonViewModel.PokemonList) { pokemon in
                    ListRow(pokemon: pokemon)
                }
            }
            .task {
                await pokemonViewModel.onApper()
            }
            .navigationTitle("初代ポケモン")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
