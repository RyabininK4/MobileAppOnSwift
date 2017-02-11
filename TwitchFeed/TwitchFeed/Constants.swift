//
//  Constants.swift
//  TwitchFeed
//
//  Created by Кирилл Рябинин on 11.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import Foundation

//Twitch API URL
let TWITCH_URL_TOP_GAMES = "https://api.twitch.tv/kraken/games/top?limit=50&client_id=bxabmfoq24vc2flvjuun2hzenoz3hcq"

let TWITCH_URL_STREAMS_BASE = "https://api.twitch.tv/kraken/streams?game="
let TWITCH_URL_STREAMS_CLIENT_ID = "&client_id=bxabmfoq24vc2flvjuun2hzenoz3hcq"

let TWITCH_URL_EMBED_BASE = "https://www.twitch.tv/"
let TWITCH_URL_EMBED = "/embed"

let TWITCH_URL_STREAM_DEEP_LINK = "twitch://open?stream="


typealias DownloadComplete = () -> ()

