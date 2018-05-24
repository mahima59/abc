//
//  SecondVC.swift
//  TagDataExample
//
//  Created by Mahima Karnwal on 2/8/18.
//  Copyright © 2018 Mahima Karnwal. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var tagView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   class func createTag(dataText:UITextField,TagView:UIView){
        var dataArray = Array<Any>()
        var xCoordinate = 20,yCoordinate = 10
        if !(dataText.text!.isEmpty){
            dataArray.append(dataText.text)
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
            if (xCoordinate+Int(width) >= Int(TagView.frame.size.width) || xCoordinate >= Int(TagView.frame.size.width)){
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
            TagView.addSubview(label)
            dataText.text = ""
            
        }
    
    
        
    }

}
