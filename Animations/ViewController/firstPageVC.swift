//
//  firstPageVC.swift
//  Animations
//
//  Created by Long Nguyen on 2/22/21.
//

import UIKit


class firstPageVC: UIViewController {
    
//MARK: - Properties
    
    var myControllers = [UIViewController]()
    let pageControl = UIPageControl()
    let page1 = Page1ViewController()
    let page2 = Page2ViewController()
    let page3 = Page3ViewController()
    
    
    private let mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Pop 2nd page"
        lb.textAlignment = .center
        lb.layer.backgroundColor = #colorLiteral(red: 0.2898526224, green: 0.9193441901, blue: 0.5178573741, alpha: 1)
        lb.layer.cornerRadius = 4
        lb.layer.borderWidth = 1.5 //the thickness of border around the label
        lb.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) //set border color
        lb.isUserInteractionEnabled = true //we add the tap gesture in a function
        
        return lb
    }()
    
    private let secondLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Animate"
        lb.textAlignment = .center
        lb.isUserInteractionEnabled = true
        lb.layer.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        lb.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //color is black
        lb.layer.shadowRadius = 4
        lb.layer.shadowOpacity = 0.5 //how clear the shadow looks
        lb.layer.shadowOffset = CGSize(width: 4, height: 4) //the dimension, size of the shadow
        //lb.layer.shadowOffset = CGSize(width: -4, height: 4) //this is for shadow on the opposite way with light shining the opposite direction
        
        return lb
    }()
    
    private let smallView: UIView = {
        let uv = UIView()
        uv.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        uv.layer.cornerRadius = 10
        uv.layer.borderWidth = 1.5 //the thickness of border around the label
        uv.layer.borderColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) //set border color
        uv.layer.contents = UIImage(named: "cat")?.cgImage //the image is from assets and it resize itself to fit the view. I have no idea how to set image from SF symbol to this UIView
        uv.clipsToBounds = true //let's fit the image inside the view's border
        
        //uv.layer.contentsGravity = CALayerContentsGravity.center //use this line to cancel any default reizing action, which means we bring in the image with original size.
        
        //uv.layer.masksToBounds = true //everything that lies outside the bound (border) is invisible, which means we erase the shadow of the view.
        
        
        return uv
    }()
    
    private let iView: UIImageView = {
        let iv = UIImageView()
        iv.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        iv.layer.cornerRadius = 10
        iv.layer.borderWidth = 1.5 //the thickness of border around the label
        iv.layer.borderColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) //set border color
        iv.image = UIImage(systemName: "car") //the image is from SF symbol (automatocally fit the image inside the view) so we use "systemName"
        //iv.image = UIImage(named: "cat") //this image is from assets (we gotta set it to fit inside the view) so we use "named"
        
        return iv
    }()
    
    private let PageVCBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("PageVC Swipe", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.addTarget(self, action: #selector(presentPageViewController), for: .touchUpInside)
        
        return btn
    }()
    
    
//MARK: - View Scenes
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        myControllers.append(page1)
        myControllers.append(page2)
        myControllers.append(page3)
        
        UIStuff()
        
        
    }

//MARK: - PageVC presenting
//use the func below to present the PageController once it is open
    
    /*override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //actually you can just say ".now()", no need to delay 2s
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.presentPageVC()
            self.pageControlStuff()
        }
    }*/
    
    
//MARK: - UI layout
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let viewWidth = view.frame.width
        //let viewHeight = view.frame.height
        
        mainLabel.frame = CGRect.init(x: viewWidth/3,
                                      y: 100,
                                      width: viewWidth/3,
                                      height: 30)
        
        secondLabel.frame = CGRect.init(x: (3*viewWidth/4) / 2,
                                        y: mainLabel.frame.height + mainLabel.frame.origin.y + 50,
                                      width: viewWidth/4,
                                      height: 30)
        
        smallView.frame = CGRect.init(x: viewWidth/3,
                                      y: secondLabel.frame.height + secondLabel.frame.origin.y + 30,
                                      width: viewWidth/3,
                                      height: 100)
        
        iView.frame = CGRect.init(x: viewWidth/3,
                                      y: smallView.frame.height + smallView.frame.origin.y + 30,
                                      width: viewWidth/3,
                                      height: 70)
        
    }
    
    
//MARK: - Functions, Selectorsa
    
    func UIStuff() {
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(presentSecondPage))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(runAnimatedAlert))
        mainLabel.addGestureRecognizer(tap1)
        secondLabel.addGestureRecognizer(tap2)
        
        
        view.addSubview(mainLabel)
        view.addSubview(secondLabel)
        view.addSubview(smallView)
        view.addSubview(iView)
        view.addSubview(PageVCBtn)
        
        PageVCBtn.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10)
        PageVCBtn.centerX(inView: view)
        
    }
    
    
    func pageControlStuff() {
        let initialPage = 0
        
        pageControl.frame = CGRect()
        //self.pageControl.setIndicatorImage(UIImage(systemName: "car"), forPage: 1)
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.numberOfPages = self.myControllers.count
        pageControl.currentPage = initialPage
        
        view.addSubview(self.pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5).isActive = true
        pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    
    @objc func presentSecondPage() {
        print("DEBUG: presenting second page")
        
        let vc = secondPageVC()
        present(vc, animated: true, completion: nil)
    }
    
    @objc func runAnimatedAlert() {
        print("DEBUG: start moving a block..")
        
    }
    
    
    @objc func presentPageViewController() {
        let vc = PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
    @objc func presentPageVC() {
        print("DEBUG: presenting pageVC..")
        guard let first = myControllers.first else {
            return
        }
        print("DEBUG: \(String(describing: first))")
        
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.setViewControllers([first],
                              direction: .forward,
                              animated: true,
                              completion: nil)
        
        vc.dataSource = self
        vc.delegate = self
        
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
    
}


//MARK: - extension PageVC
//this will help present a pageViewController from this VC

extension firstPageVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
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
