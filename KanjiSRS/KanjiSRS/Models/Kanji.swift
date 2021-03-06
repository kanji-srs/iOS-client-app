//
//  Kanji.swift
//  KanjiSRS
//
//  Created by Scott Enriquez on 8/15/20.
//  Copyright © 2020 Scott Enriquez. All rights reserved.
//

import Foundation

struct Kanji: Codable, Hashable {
    var character: String
    var name: String
    var strokeCount: Int
    var meaning: String
    var grade: Int?
    var kunyomiHiragana: String
    var kunyomi: String
    var onyomiKatakana: String
    var onyomi: String
    var examples: [[String]]
    var radical: String
    var radicalOrder: Double
    var radicalStrokes: Int
    var radicalNameHiragana: String
    var radicalName: String
    var radicalMeaning: String
    var radicalPositionHiragana: String
    var radicalPosition: String
}
