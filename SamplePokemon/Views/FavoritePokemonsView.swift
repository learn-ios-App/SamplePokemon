//
//  FavoritePokemonsView.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/17.
//

import SwiftUI

struct FavoritePokemonsView: View {
    @State var pokemons: [CustomPokemon]
    var body: some View {
        List {
            ForEach(pokemons) { pokemon in
                ListRow(pokemon: pokemon)
            }
        }
    }
}

struct FavoritePokemonsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
