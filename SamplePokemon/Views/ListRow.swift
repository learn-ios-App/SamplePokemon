//
//  ListRow.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/16.
//

import SwiftUI

struct ListRow: View {
    @State var pokemon: CustomPokemon
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
                Text(pokemon.jaName)
                Text(pokemon.enName)
            }
            Spacer()
            Button(action: {
                pokemon.favorite.toggle()
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
    }
}
