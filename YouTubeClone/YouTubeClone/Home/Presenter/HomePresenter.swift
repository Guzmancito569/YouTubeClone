//
//  HomePresenter.swift
//  YouTubeClone
//
//  Created by Byron Guzman on 3/15/23.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func getData(list: [[Any]])
}

class HomePresenter {
    
    var provider: HomeProviderProtocol
    weak var delegate: HomeViewProtocol?

    init(provider: HomeProviderProtocol = HomeProvider(), delegate: HomeViewProtocol? = nil) {
        self.provider = provider
        self.delegate = delegate
    }
    
    func getVideos() {
        
    }
}
