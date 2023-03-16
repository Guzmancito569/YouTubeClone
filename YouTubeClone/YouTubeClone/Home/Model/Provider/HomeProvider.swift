//
//  HomeProvider.swift
//  YouTubeClone
//
//  Created by Byron Guzman on 3/15/23.
//

import Foundation

protocol HomeProviderProtocol {
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel
}

class HomeProvider: HomeProviderProtocol {
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel {
        var queryParams = ["part": "snippet"]
        if !channelId.isEmpty { queryParams["channelId"] = channelId }
        if !searchString.isEmpty { queryParams["q"] = searchString }
        let requestmodel = RequestModel(endpoint: .search, queryItems: queryParams)
        do {
            let model = try await ServiceLayer.callService(requestmodel, VideoModel.self)
            return model
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
