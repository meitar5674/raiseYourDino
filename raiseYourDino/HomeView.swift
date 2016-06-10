//
//  ViewController.swift
//  raiseYourDino
//
//  Created by Meitar Basson on 09/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import UIKit

class HomeView: UIViewController {
    
    var dinoMain: DinoMain!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadDinoPlay(sender: AnyObject) {
        dinoMain = DinoMain(nibName: "DinoMain", bundle: nil)
        self.presentViewController(dinoMain, animated: true, completion: nil)
    }
    
}

