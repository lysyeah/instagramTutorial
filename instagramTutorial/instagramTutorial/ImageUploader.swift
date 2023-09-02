//
//  ImageUploader.swift
//  instagramTutorial
//
//  Created by 이용수 on 2023/08/29.
//
import UIKit
import Firebase
import SwiftUI
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image : UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/ \(filename)")
        
        do{
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        }catch{
            print("DEBUG : Failed to upload the image with error \(error.localizedDescription)")
            return nil
        }
    }
}
