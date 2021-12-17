//
//  RadioModelStations.swift
//  Apple_Music
//
//  Created by Артем on 16.10.2021.
//

import Foundation

struct RadioModelStations: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let subtitle: String
}

extension RadioModelStations {
    static let data = [
        RadioModelStations(image: "zaneLoweShow",
                           title: "The Zane Lowe Show",
                           subtitle: "Apple Music"),
        RadioModelStations(image: "upNextRadio",
                           title: "Up Next Radio",
                           subtitle: "Apple Music"),
        RadioModelStations(image: "africaNowRadio",
                           title: "Для расслабления",
                           subtitle: "Электронная медитация."),
        RadioModelStations(image: "classicRock",
                           title: "Классика рokа",
                           subtitle: "Гитарный звук."),
        RadioModelStations(image: "rapLifeRadio",
                           title: "Хип-хоп",
                           subtitle: "Идеальные биты."),
        RadioModelStations(image: "michaelkrugPlayer",
                           title: "Музыка 90-х",
                           subtitle: "Зажигай."),
        RadioModelStations(image: "superBloomRadio",
                           title: "RnB",
                           subtitle: "Будь в движении."),
        RadioModelStations(image: "michaelkrugPlayer",
                           title: "Музыка 90-х",
                           subtitle: "Зажигай."),
        RadioModelStations(image: "zaneLoweShow",
                           title: "The Zane Lowe Show",
                           subtitle: "Apple Music"),
        RadioModelStations(image: "upNextRadio",
                           title: "Up Next Radio",
                           subtitle: "Apple Music"),
        RadioModelStations(image: "africaNowRadio",
                           title: "Для расслабления",
                           subtitle: "Электронная медитация."),
        RadioModelStations(image: "classicRock",
                           title: "Классика рokа",
                           subtitle: "Гитарный звук.")
    ]
}
