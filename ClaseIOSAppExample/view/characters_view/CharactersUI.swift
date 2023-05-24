//
//  CharactersUI.swift
//  ClaseIOSAppExample
//
//  Created by Melvin Antonio Callisaya Tiñini on 28/4/23.
//

import Foundation
import SwiftUI

struct CharactersUI: View {
    
    @StateObject var charactersVM = CharactersVM()
    @Binding var screen: Screens
    
    var body: some View {
        GeometryReader { geo in
            if charactersVM.showMessageError == "" {
                List {
                    ForEach(charactersVM.results, id: \.id) { res in
                        Button(
                            action:  {
                                screen = .Description
                            }
                        ) {
                            ItemCharactersUI(
                                url: "\(res.thumbnail.path).\(res.thumbnail.thumbnailExtension)",
                                name: res.name
                            )
                            .frame(width: geo.size.width, height: 500)
                        }
                        
                    }
                }
            } else {
                Text(charactersVM.showMessageError)
            }
        }.onAppear {
            charactersVM.getCharacters()
        }
    }
}



struct CharactersUI_Previews: PreviewProvider {
    @State static var screen: Screens = .Characters
    static var previews: some View {
        CharactersUI(screen: $screen)
    }
}
