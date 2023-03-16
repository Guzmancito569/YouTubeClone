//
//  RequestModel.swift
//  YouTubeClone
//
//  Created by Byron Guzman on 3/15/23.
//

import Foundation

struct RequestModel {
    let endpoint: Endpoint
    let queryItems: [String:String]?
    let httpMethod: HttpMethod = .GET
    var baseUrl: URLBase = .youtube
    
    func getURL() -> String {
        return baseUrl.rawValue + endpoint.rawValue
    }
    
    enum HttpMethod: String {
        case GET
        case POST
    }
    
    enum Endpoint: String {
        case empty = ""
        case search = "/search"
    }
    
    enum URLBase: String {
        case youtube = "https://youtube.googleapis.com/youtube/v3"
        case google = "https://othereweb.com/v2"
    }
}
