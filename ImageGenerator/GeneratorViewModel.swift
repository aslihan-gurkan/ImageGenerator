//
//  GeneratorViewModel.swift
//  ImageGenerator
//
//  Created by Aslıhan Gürkan on 24.04.2024.
//

import Foundation

extension GeneratorView {
    
    class ViewModel: ObservableObject {
        
        @Published var duration = 0
        @Published var image: URL?
        
        
        let prompt: String
        let selectedStyle: ImageStyle
        
        init(prompt: String, selectedStyle: ImageStyle) {
            self.prompt = prompt
            self.selectedStyle = selectedStyle
        }
        
        func generatedImage() {
            let formattedPrompt = "\(selectedStyle.title) image of \(prompt)"
            //TODO
        }
    }
}
