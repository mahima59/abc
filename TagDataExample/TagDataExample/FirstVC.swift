//
//  FirstVC.swift
//  TagDataExample
//
//  Created by Mahima Karnwal on 10/27/17.
//  Copyright © 2017 Mahima Karnwal. All rights reserved.
//

import UIKit
class FirstVC: UIViewController {
    
     
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    var dataArray = Array<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGray
        nextBtn.layer.cornerRadius = 10
        scrollView.contentSize = CGSize(width:self.view.frame.width, height:self.view.frame.height+3)
       
    }
    
    func createTag(){
        var xCoordinate = 20,yCoordinate = 10
        if !(dataTextField.text?.isEmpty)!{
            dataArray.append(dataTextField.text)
        }
        for data in dataArray {
            let label = UILabel()
            //  if xCoordinate >= Int(tagView.frame.size.width)  {
            label.padding = UIEdgeInsets(top: 0, left: 3, bottom:0 , right: 0)
            let originalString: String = (data as? String)!
            let font = UIFont.systemFont(ofSize: 17.0)
            label.font = font
            label.numberOfLines = 0
            label.textAlignment = .natural
            label.sizeToFit()
            let text = originalString as NSString
            let size = text.size(attributes: [NSFontAttributeName:font])
            let width = (size.width+5)
            if (xCoordinate+Int(width) >= Int(view.frame.size.width) || xCoordinate >= Int(tagView.frame.size.width)){
                yCoordinate = yCoordinate + 50
                xCoordinate = 20
            }
            label.frame = CGRect(x: xCoordinate, y: yCoordinate, width:Int(width) , height: 30)
            label.text = originalString
            xCoordinate = xCoordinate + Int(label.frame.size.width+5)
            label.backgroundColor = UIColor.init(red: 0.0, green: 204/255, blue: 204/255, alpha: 1)
            label.layer.cornerRadius = 5
            label.layer.masksToBounds = true
            label.textColor = UIColor.white
            tagView.addSubview(label)
            dataTextField.text = ""
        }
        
    }
    
    @IBAction func nextBtnTapped(_ sender: AnyObject) {
        createTag()
    }
    
}
