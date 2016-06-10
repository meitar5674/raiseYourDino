//
//  ImageAnimation.swift
//  raiseYourDino
//
//  Created by Meitar Basson on 10/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import Foundation
import UIKit


class ImageAnimation: UIImageView{
    
    
    var imgArray = [UIImage]()
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func sortArray(lastImage: Int){
        for x in 1...lastImage {
            let img = UIImage(named: "egg\(x).png")
            imgArray.append(img!)
        }
    }
    
    func animationStart(){
        self.animationImages = imgArray
        self.animationDuration = 1.2
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
}
