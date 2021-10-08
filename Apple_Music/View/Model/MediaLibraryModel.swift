//
//  MediaLibraryModel.swift
//  Apple_Music
//
//  Created by Артем on 08.10.2021.
//

import Foundation
import SwiftUI

struct MediaLibraryModel: Hashable {
    let image: String
    let title: String
}

extension MediaLibraryModel {
    static var data = [
        MediaLibraryModel(image: "music.note.list", title: "Плейлиста"),
        MediaLibraryModel(image: "music.mic", title: "Артисты"),
        MediaLibraryModel(image: "rectangle.stack", title: "Альбомы"),
        MediaLibraryModel(image: "music.note", title: "Песни"),
        MediaLibraryModel(image: "airplayvideo", title: "Телешоу и фильмы"),
        MediaLibraryModel(image: "tv.music.note.fill", title: "Видеоклипы"),
        MediaLibraryModel(image: "guitars", title: "Жанры"),
        MediaLibraryModel(image: "doc", title: "Сборники"),
        MediaLibraryModel(image: "music.note", title: "Авторы"),
        MediaLibraryModel(image: "square.and.arrow.down", title: "Загруженно"),
        MediaLibraryModel(image: "house", title: "Коллекции")
    ]
}
