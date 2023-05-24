//
//  ContentView.swift
//  ClaseIOSAppExample
//
//  Created by Melvin Antonio Callisaya Tiñini on 28/4/23.
//

import SwiftUI

struct ContentView: View {

    @State var screen: Screens = .Characters
    var body: some View {
        switch screen {
        case .Characters:
            CharactersUI(screen: $screen)
        case .Description:
            DescriptionUI()
        }
    }
}

enum Screens {
    case Characters, Description
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
