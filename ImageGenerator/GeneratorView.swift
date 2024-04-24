//
//  GeneratorView.swift
//  ImageGenerator
//
//  Created by Aslıhan Gürkan on 24.04.2024.
//

import SwiftUI

struct GeneratorView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Generated Image")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            VStack {
                Text("Time spent: \("")")
                AsyncImage(url: viewModel.image) { image in
                    image.resizable().aspectRatio(1, contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .background(Color.gray.opacity(0.2))
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .clipped()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    GeneratorView(viewModel: .init(prompt: "red car", selectedStyle: .threeDRender))
}
