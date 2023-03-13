//
//  RootPageViewController.swift
//  YouTubeClone
//
//  Created by Byron Guzman on 3/12/23.
//

import UIKit

protocol RootPageProtocol: AnyObject {
    func currentPage(_ index: Int )
}

class RootPageViewController: UIPageViewController {
    
    var subViewController = [UIViewController]()
    var currentIndex = 0
    weak var delegateRoot: RootPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        setupViewController()
    }
    
    private func setupViewController() {
        subViewController = [
            HomeViewController(),
            VideosViewController(),
            PlaylistsViewController(),
            ChannelViewController(),
            AboutViewController(),
        ]
        
        _ = subViewController.enumerated().map({ $0.element.view.tag = $0.offset })
        setViewControllerFromIndex(index: 0, direccion: .forward)
    }
    func setViewControllerFromIndex(index: Int, direccion: NavigationDirection) {
        setViewControllers([subViewController[index]], direction: direccion, animated: true)
    }
}

extension RootPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewController.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = subViewController.firstIndex(of: viewController) ?? 0
        return index <= 0 ? nil : subViewController[index-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = subViewController.firstIndex(of: viewController) ?? 0
        return index >= subViewController.count - 1 ? nil : subViewController[index+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted: Bool) {
        if let index = pageViewController.viewControllers?.first?.view.tag {
            currentIndex = index
            delegateRoot?.currentPage(index)
        }
    }
    
}
