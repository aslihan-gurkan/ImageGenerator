//
//  ContentView.swift
//  ImageGenerator
//
//  Created by Aslıhan Gürkan on 24.04.2024.
//

import SwiftUI


struct PromptView: View {
    @State var selectedStyle = ImageStyle.allCases[0]
    @State var promptText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Generate")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
            Text("Choose a style")
                .font(.title3)
                .bold()
                .foregroundStyle(.white)
            GeometryReader { reader in
                ScrollView(.horizontal,
                           showsIndicators: false) {
                    HStack {
                        ForEach(ImageStyle.allCases, id: \.self) { imageStyle in
                            Button {
                                selectedStyle = imageStyle
                            } label: {
                                
                                Image(imageStyle
                                    .rawValue)
                                .resizable()
                                .background(Color.blue)
                                .scaledToFill()
                                .frame(width: reader.size.width * 0.4,
                                       height: reader.size.width * 0.4 * 1.4)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20).stroke(Color.yellow, lineWidth: imageStyle == selectedStyle ? 3 : 0)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                            
                        }
                    }
                }
            }
            Spacer()
            Text("Enter a prompt")
                .font(.title3)
                .bold()
                .foregroundStyle(.white)
            TextEditor(text: $promptText)
                .scrollContentBackground(.hidden)
                .padding()
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .foregroundColor(.white)
                .tint(Color.yellow)
            VStack(alignment: .center) {
                Button {
                    
                } label: {
                    Text("Generate")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.yellow)
                        .clipShape(Capsule())
                }
            }
            .frame(maxWidth: .infinity)
            
        }
        .padding()
        .background(Color.black
            .edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    PromptView()
}
