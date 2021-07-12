//
//  PageViewController.swift
//  Onboarding
//
//  Created by Macbook on 9.07.2021.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var controllers = [UIViewController]()
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate  = self
        
        controllers.append(getVC(storyBoardID: "firstPageVC"))
        controllers.append(getVC(storyBoardID: "secondPageVC"))
        controllers.append(getVC(storyBoardID: "thirdPageVC"))
        
        guard let first = controllers.first else { return }

        setViewControllers([first], direction: .forward, animated: true, completion: nil)
        configurePageControl()
    }

    func getVC(storyBoardID: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: storyBoardID)
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        pageControl.currentPage = 0
        pageControl.numberOfPages = controllers.count
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = UIColor(red: 21 / 255, green: 144 / 255, blue: 202 / 255, alpha: 1)
        pageControl.subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
        }
        self.view.addSubview(pageControl)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController) else {
            return nil
        }
        
        if index == 0 {
            return controllers[controllers.count - 1]
        }
        
        return controllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController) else {
            return nil
        }
        
        if index == controllers.count - 1 {
            return controllers[0]
        }
        
        return controllers[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let pageControlVCs = pageViewController.viewControllers?.first{
            self.pageControl.currentPage = controllers.firstIndex(of: pageControlVCs)!
        }
        
    }
    
}
