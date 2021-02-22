//
//  secondPageVC.swift
//  Animations
//
//  Created by Long Nguyen on 2/22/21.
//

import UIKit

class secondPageVC: UIViewController {

//MARK: - Properties
    
    lazy var gradientLayer: CAGradientLayer = {
        let gl = CAGradientLayer()
        gl.colors = [UIColor.red.cgColor, UIColor.green.cgColor]
        
        //gl.locations = [0, 1] //the gradient works vertically, the marks indicate where the gradient (2 or more colors equally divided) starts and stops. the entire screen, both view.width and view.height are 0 -> 1
        
        
        //if we want to specify the directions and how the gradient runs, then use the "startPoint" and "endPoint"
        gl.startPoint = CGPoint(x: 0.0, y: 0.0) //CG is "core graphic". the coordinate starts from the top left corner
        //gl.endPoint = CGPoint(x: 1.0, y: 1.0) //make the gradient run in a diagnal direction
        gl.endPoint = CGPoint(x: 1.0, y: 0.0) //make the gradient run in a horizontal direction
        
        return gl
    }()
    
    
    private let blockView: UIView = {
        let uv = UIView()
        uv.backgroundColor = .yellow
        uv.isUserInteractionEnabled = true
        
        return uv
    }()
    
    private let alertButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Customize Alert", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        btn.backgroundColor = .cyan
        
        btn.addTarget(self, action: #selector(presentCustomizedAlert), for: .touchUpInside)
        
        return btn
    }()
    
    
//MARK: - View Scenes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = view.bounds
        let viewWidth = view.frame.width
        let viewHeight = view.frame.height
        
        blockView.frame = CGRect(x: viewWidth/3,
                                 y: 100,
                                 width: viewWidth/3,
                                 height: viewHeight/5)
        
        alertButton.frame = CGRect(x: viewWidth/4,
                                   y: blockView.frame.origin.y + blockView.frame.height + 40,
                                   width: viewWidth/2,
                                   height: 40)
        
    }
    
    
//MARK: - Functions, selectors
    
    func configureUI() {
        
        view.layer.addSublayer(gradientLayer)
        view.addSubview(blockView)
        view.addSubview(alertButton)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapStuff))
        blockView.addGestureRecognizer(tap)
    }
    
    
    @objc func tapStuff() {
        print("DEBUG: view got tapped..")
        
        //to perform multiple animations in an order, we use the completion block: "UIView.animate(duration, animation, completion)"
        UIView.animate(withDuration: 1.2) {
            
            //self.changeSizeOfBlock()
            self.changePositionOfBlock()
        }
        
    }
    
    
    func changeSizeOfBlock() {
        let sizeMultiplier: CGFloat = 1.5
        let currentBlockFrame = blockView.frame
        
        blockView.frame.size = CGSize(width: currentBlockFrame.width * sizeMultiplier, height: currentBlockFrame.height * sizeMultiplier)
        
    }
    
    
    func changePositionOfBlock() {
        
        blockView.frame = CGRect(x: 0,
                                 y: 500,
                                 width: 50,
                                 height: 50)
        
    }
    
    
    @objc func presentCustomizedAlert() {
        print("DEBUG: presenting customized alert..")
        
        //the block below will perform action 2s after the func presentCustomizedAlert gets called
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("DEBUG: appear after 2 seconds delayed")
            
            
        }
        
        
    }
    
}
