//
//  CharactersVM.swift
//  ClaseIOSAppExample
//
//  Created by Melvin Antonio Callisaya Tiñini on 28/4/23.
//

import Foundation

class CharactersVM: ObservableObject {
    
    private let charactersRepo = CharactersRepository()
    
    @Published var results: [Result] = []
    @Published var showMessageError: String = ""
    func getCharacters() {
        Task {
            do {
                let res = try await charactersRepo.getAllCharacters()
                showMessageError = ""
                results = res.data.results
            } catch let err {
                showMessageError = "\(err)"
                print("Error: \(err)")
            }
        }
    }
}
