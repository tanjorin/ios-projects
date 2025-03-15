//
//  PhotoPickerView.swift
//  BeRealClone
//
//  Created by Temi on 3/8/25.
//

import SwiftUI
import PhotosUI
import ParseSwift

struct PhotoPickerView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil

    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .padding()
            }

            PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                Text("Select a Photo")
            }
            .onChange(of: selectedItem) { newItem in
                loadImage(from: newItem)
            }

            if selectedImage != nil {
                Button("Upload Photo") {
                    uploadImageToParse()
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
    }

    func loadImage(from item: PhotosPickerItem?) {
        item?.loadTransferable(type: Data.self) { result in
            if let data = try? result.get(), let image = UIImage(data: data) {
                selectedImage = image
            }
        }
    }

    func uploadImageToParse() {
        guard let image = selectedImage,
              let imageData = image.jpegData(compressionQuality: 0.1) else { return }

        var post = Post()
        post.imageFile = ParseFile(name: "image.jpg", data: imageData)
        post.user = User.current

        post.save { _ in selectedImage = nil }
    }
}

