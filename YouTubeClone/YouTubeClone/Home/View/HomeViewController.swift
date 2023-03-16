//
//  HomeViewController.swift
//  YouTubeClone
//
//  Created by Byron Guzman on 3/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var presenter = HomePresenter(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }

}

extension HomeViewController: HomeViewProtocol {
    func getData(list: [[Any]]) {
        print("list: \(list)")
    }
}
