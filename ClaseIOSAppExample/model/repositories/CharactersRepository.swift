//
//  CharactersRepository.swift
//  ClaseIOSAppExample
//
//  Created by Melvin Antonio Callisaya Tiñini on 28/4/23.
//

import Foundation

class CharactersRepository {
    
    func getAllCharacters() async throws -> Characters {
        return try await ApiRest.getCharacters()
    }// esto es una prueba
}
