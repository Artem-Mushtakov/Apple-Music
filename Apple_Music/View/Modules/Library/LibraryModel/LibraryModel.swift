//
//  LibraryModel.swift
//  Apple_Music
//
//  Created by Артем on 08.10.2021.
//

import Foundation

struct LibraryModel: Hashable {
    let image: String
    let title: String
}

extension LibraryModel {
    static var data = [
        LibraryModel(image: "music.note.list", title: "Плейлиста"),
        LibraryModel(image: "music.mic", title: "Артисты"),
        LibraryModel(image: "rectangle.stack", title: "Альбомы"),
        LibraryModel(image: "music.note", title: "Песни"),
        LibraryModel(image: "airplayvideo", title: "Телешоу и фильмы"),
        LibraryModel(image: "tv.music.note.fill", title: "Видеоклипы"),
        LibraryModel(image: "guitars", title: "Жанры"),
        LibraryModel(image: "doc", title: "Сборники"),
        LibraryModel(image: "music.note", title: "Авторы"),
        LibraryModel(image: "square.and.arrow.down", title: "Загруженно"),
        LibraryModel(image: "house", title: "Коллекции")
    ]
}
