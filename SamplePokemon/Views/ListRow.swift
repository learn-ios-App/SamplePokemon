//
//  ListRow.swift
//  SamplePokemon
//
//  Created by 渡邊魁優 on 2023/04/16.
//

import SwiftUI

struct ListRow: View {
    @State var pokemon: Pokemon
    var body: some View {
        HStack {
            AsyncImage(url: pokemon.sprites.frontImage) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
            } placeholder: {
                ProgressView()
            }
            
            Text(pokemon.name)
            Spacer()
            
            Button(action: {
            }) {
                Image(systemName: "heart")
                    .foregroundColor(Color.pink)
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
