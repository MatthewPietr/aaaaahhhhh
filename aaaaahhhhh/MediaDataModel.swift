//
//  MediaDataModel.swift
//  aaaaahhhhh
//
//  Created by Matthew Pietrucha on 10/29/20.
//

import UIKit

class MediaDataModel: Codable {

    var console: [Console]
}

class Console:Codable {
    let consoleName: String
    let games: [Game]
}

class Game:Codable {
    let gameName:String
    let type:String
    let yearShown:String
    let yearReleased:String?
    let howLongToBeatInHrs: Int?
    let gameStudio: String?
    let URLForImage: String
    let descriptionForGame: String
    let summaryForGame: String
    let voiceActors: [VoiceAct]
}

class VoiceAct:Codable {
    let voiceActorName: String
    let personVoiced: String
}
