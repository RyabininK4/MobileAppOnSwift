//
//  Constants.swift
//  TwitchFeed
//
//  Created by Кирилл Рябинин on 11.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import Foundation

//Twitch API URL
let TWITCH_URL_TOP_GAMES = "https://api.twitch.tv/kraken/games/top?limit=50&client_id=rhhv0l0dpqvcxi0bu7ht41r17fw61p"

let TWITCH_URL_STREAMS_BASE = "https://api.twitch.tv/kraken/streams?game="
let TWITCH_URL_STREAMS_CLIENT_ID = "&client_id=rhhv0l0dpqvcxi0bu7ht41r17fw61p"

typealias DownloadComplete = () -> ()

