//
//  RadioModelExclusive.swift
//  Apple_Music
//
//  Created by Артем on 16.10.2021.
//

import Foundation

struct RadioModelExclusive: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let title: String
    let subTitle: String
    let groupTitle: String
}

extension RadioModelExclusive {
    static let data = [
        RadioModelExclusive(image: "musicBazarBasta",
                            title: "НОВЫЙ ВЫПУСК",
                            subTitle: "Музыкальный базар с Бастой",
                            groupTitle: "Новое шоу"),
        RadioModelExclusive(image: "popularRadio",
                            title: "ИЗБРАННАЯ РАДИОСТАНЦИЯ",
                            subTitle: "Популярное",
                            groupTitle: "То, что слушают прямо сейчас."),
        RadioModelExclusive(image: "hipHop",
                            title: "ИЗБРАННАЯ РАДИОСТАНЦИЯ",
                            subTitle: "Хип-хоп",
                            groupTitle: "Идеальные биты и рифмы"),
        RadioModelExclusive(image: "popMusic",
                            title: "ИЗБРАННАЯ РАДИОСТАНЦИЯ",
                            subTitle: "Только поп-музыка",
                            groupTitle: "Все топ-хиты."),
        RadioModelExclusive(image: "popMusicTrain",
                            title: "ИЗБРАННАЯ РАДИОСТАНЦИЯ",
                            subTitle: "Поп-музыка для тренировок",
                            groupTitle: "Вперед и с музыкой!"),
        RadioModelExclusive(image: "electroMusic",
                            title: "ИЗБРАННАЯ РАДИОСТАНЦИЯ",
                            subTitle: "Электронная музыка",
                            groupTitle: "Пульт с лучшими треками."),
        RadioModelExclusive(image: "classicRock",
                            title: "НОВАЯ РАДИОСТАНЦИЯ",
                            subTitle: "Классика рока",
                            groupTitle: "Гении гитарного звука."),
        RadioModelExclusive(image: "danceMusic",
                            title: "ИЗБРАННАЯ РАДИОСТАНЦИЯ",
                            subTitle: "Танцевальная музыка",
                            groupTitle: "Современные и будущие хиты.")
    ]
}
