//
//  ListRow.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/16.
//

import SwiftUI

struct ListRow: View {
    @EnvironmentObject var pokemonViewModel: PokemonData
    @Binding var pokemon: CustomPokemon
    var body: some View {
        HStack {
            AsyncImage(url: pokemon.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
            } placeholder: {
                ProgressView()
            }
            VStack {
                Text(pokemon.nameJP)
                Text(pokemon.nameENG)
            }
            Spacer()
            Button(action: {
                pokemonViewModel.didTapFavoritButton(pokemon: pokemon)
            }) {
                Image(systemName: pokemon.favorite
                      ? "heart.fill"
                      : "heart"
                )
                    .foregroundColor(.pink)
            }
            .buttonStyle(.borderless)
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PokemonData())
    }
}
