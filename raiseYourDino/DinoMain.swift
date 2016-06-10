//
//  DinoMain.swift
//  raiseYourDino
//
//  Created by Meitar Basson on 10/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import UIKit

class DinoMain: UIViewController {
    
    
    @IBOutlet weak var eggImg: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var meatImg: DragImg!
    @IBOutlet weak var boneImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var fireImg: DragImg!
    @IBOutlet weak var expSlider: UISlider!
    @IBOutlet weak var expLabel: UILabel!
    var player: EggStatus!
    var dinoStats: DinoStats!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        player = EggStatus.init(name: "Meitar")
        meatImg.dropTarget = eggImg
        heartImg.dropTarget = eggImg
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DinoMain.itemDroppedOnCharacter(_:)), name: "onTargetDropped", object: nil)
    }
    
    func itemDroppedOnCharacter(notif: AnyObject){
        print("Moo")
    }

    @IBAction func checkStats(sender: AnyObject) {
        dinoStats = DinoStats(nibName: "DinoStats", bundle: nil)
        self.presentViewController(dinoStats, animated: true, completion: nil)
    }
    
}
