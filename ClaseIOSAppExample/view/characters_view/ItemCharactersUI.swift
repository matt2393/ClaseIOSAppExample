//
//  ItemCharactersUI.swift
//  ClaseIOSAppExample
//
//  Created by Melvin Antonio Callisaya Tiñini on 28/4/23.
//

import Foundation
import SwiftUI

struct ItemCharactersUI: View {
    let url: String
    let name: String
    init(url: String, name: String) {
        self.url = url
        self.name = name
    }
    init(url: String) {
        self.url = url
        self.name = ""
    }
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                AsyncImage(
                    url: URL(string: url),
                    content: { im in
                        im.resizable()
                },
                    placeholder: {
                        ProgressView()
                    }
                )
                .frame(width: geo.size.width, height: geo.size.height - 20)
                
                Text(name)
                    .font(.system(size: 21, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: geo.size.width)
                    .padding(.vertical, 5)
                    .background(Color.black)
            
            }
        }
    }
}

struct ItemChatactersUI_Previews: PreviewProvider {
    static var previews: some View {
        ItemCharactersUI(
            url: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg", name: "HERO"
        )
    }
}
