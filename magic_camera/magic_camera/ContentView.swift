//
//  ContentView.swift
//  magic_camera
//
//  Created by Aya Shikh Suliman on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showImagePicker: Bool = false
    @State private var image: UIImage?

    var body: some View {
        VStack {
            if let takenImage = image {
                Image(uiImage: takenImage)
                    .resizable()
                    .scaledToFit()
                    .padding()
            } else {
                Button("Take Photo") {
                    self.showImagePicker = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker)
        }
    }

    func loadImage() {
        guard let selectedImage = image else { return }
        // You can perform further actions with the taken image here
        // For example, save it to the photo library or send it to a server
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

