//
//  firstPageVC.swift
//  Animations
//
//  Created by Long Nguyen on 2/22/21.
//

import UIKit


class firstPageVC: UIViewController {
    
//MARK: - Properties
    
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
    
    
//MARK: - View Scenes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        UIStuff()
    }

    
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
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(runAnimation))
        mainLabel.addGestureRecognizer(tap1)
        secondLabel.addGestureRecognizer(tap2)
        
        
        view.addSubview(mainLabel)
        view.addSubview(secondLabel)
        view.addSubview(smallView)
        view.addSubview(iView)
        
    }
    
    
    @objc func presentSecondPage() {
        print("DEBUG: presenting second page")
        
        let vc = secondPageVC()
        present(vc, animated: true, completion: nil)
    }
    
    @objc func runAnimation() {
        print("DEBUG: start moving a block..")
        
    }
    
    
}
