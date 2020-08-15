//
//  Kanji.swift
//  KanjiSRS
//
//  Created by Scott Enriquez on 8/15/20.
//  Copyright © 2020 Scott Enriquez. All rights reserved.
//

import Foundation

struct Kanji: Codable {
    var kanji: String
    var kanjiName: String
    var kanjiStrokeCount: String
    var kanjiMeaning: String
    var kanjiGrade: String
    var kunyomiHiragana: String
    var kunyomi: String
    var onyomiKatakana: String
    var onyomi: String
    var examples: String
    var radical: String
    var radicalOrder: String
    var radicalStrokes: String
    var radicalNameHiragana: String
    var radicalName: String
    var radicalMeaning: String
    var radicalPositionHiragana: String
    var radicalPosition: String
}
