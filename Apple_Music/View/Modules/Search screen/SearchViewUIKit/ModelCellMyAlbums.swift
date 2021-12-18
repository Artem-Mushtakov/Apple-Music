//
//  ModelCellMyAlbums.swift
//  Standard-App-Photo-IPhone
//
//  Created by Артем on 08.08.2021.
//

import UIKit

struct ModelCellMyAlbums {
    let type: ModelCellType
    let titleImage: UIImageView
    let titleLabel: String
    let titleCount: String
}

extension ModelCellMyAlbums {

   static var data = ["Section0": [
        ModelCellMyAlbums(
            type: .cellMyAlbums,
            titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums1")!),
            titleLabel: "Недавние",
            titleCount: "9 259"),
        ModelCellMyAlbums(
            type: .cellMyAlbums,
            titleImage: UIImageView.init(image: UIImage(named: "ImageMyAlbums2")!),
            titleLabel: "Избранное",
            titleCount: "123"),
        ModelCellMyAlbums(
            type: .cellMyAlbums,
            titleImage: UIImageView.init(image: UIImage(named: "ImageMyAlbums3")!),
            titleLabel: "Instagram",
            titleCount: "654"),
        ModelCellMyAlbums(
            type: .cellMyAlbums,
            titleImage: UIImageView.init(image: UIImage(named: "ImageMyAlbums4")!),
            titleLabel: "WhatsApp",
            titleCount: "14"),
        ModelCellMyAlbums(
            type: .cellMyAlbums,
            titleImage: UIImageView.init(image: UIImage(named: "ImageMyAlbums5")!),
            titleLabel: "FaceApp",
            titleCount: "321"),
        ModelCellMyAlbums(
            type: .cellMyAlbums,
            titleImage: UIImageView.init(image: UIImage(named: "ImageMyAlbums6")!),
            titleLabel: "Gradient",
            titleCount: "456"),
        ModelCellMyAlbums(
            type: .cellMyAlbums,
            titleImage: UIImageView.init(image: UIImage(named: "ImageMyAlbums3")!),
            titleLabel: "Movavi Clips",
            titleCount: "321"),
        ModelCellMyAlbums(
            type: .cellMyAlbums,
            titleImage: UIImageView.init(image: UIImage(named: "imageMyAlbums1")!),
            titleLabel: "Недавние",
            titleCount: "456")]
    ]
}
