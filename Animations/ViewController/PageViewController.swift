//
//  PageViewController.swift
//  Animations
//
//  Created by Long Nguyen on 2/25/21.
//

import UIKit

class PageViewController: UIPageViewController {

    var myControllers = [UIViewController]()
    let pageControl = UIPageControl()
    let page1 = Page1ViewController()
    let page2 = Page2ViewController()
    let page3 = Page3ViewController()
    
    
//MARK: - View Scenes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        myControllers.append(page1)
        myControllers.append(page2)
        myControllers.append(page3)
        
        configurePageVC()
        pageControlStuff()
    }
    
    
//MARK: - Functions, selectors
    
    func configurePageVC() {
        print("DEBUG: presenting pageVC..")
        guard let first = myControllers.first else {
            return
        }
        print("DEBUG: \(String(describing: first))")
        
        
        self.setViewControllers([first],
                              direction: .forward,
                              animated: true,
                              completion: nil)
        
        self.dataSource = self
        self.delegate = self
        
    }
    
    
    func pageControlStuff() {
        let initialPage = 0
        
        self.pageControl.frame = CGRect()
        //self.pageControl.preferredIndicatorImage = UIImage(systemName: "car")
        self.pageControl.layer.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.numberOfPages = self.myControllers.count
        self.pageControl.currentPage = initialPage
        
        self.view.addSubview(self.pageControl)
        
        pageControl.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 30, paddingBottom: 10, paddingRight: 30)
        //pageControl.centerX(inView: self.view)
    }
    
    

}


//MARK: - extension PageVC
//this will help present a pageViewController from this VC

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = myControllers.firstIndex(of: viewController), index > 0 else {
            return nil
        }
        let before = index - 1
        
        return myControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = myControllers.firstIndex(of: viewController), index < (myControllers.count - 1) else {
            return nil
        }
        let after = index + 1
        
        return myControllers[after]
    }
    
    
    //let's deal with the pageControl UI stuff
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.myControllers.index(of: viewControllers[0]) {
                self.pageControl.currentPage = viewControllerIndex
            }
        }
    }
    
    
}
