//
//  DinoStats.swift
//  raiseYourDino
//
//  Created by Meitar Basson on 09/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//


import UIKit

class DinoStats: UIViewController {
    
    @IBOutlet weak var loveStatus: UILabel!
    @IBOutlet weak var happinessStatus: UILabel!
    @IBOutlet weak var hungerStatus: UILabel!
    @IBOutlet weak var warmthStatus: UILabel!
    @IBOutlet weak var loveBar: UISlider!
    @IBOutlet weak var happinessBar: UISlider!
    @IBOutlet weak var hungerBar: UISlider!
    @IBOutlet weak var warmthBar: UISlider!
    

    var dinoMain: DinoMain!
    var updateTimer: NSTimer!
    var player1: EggStatus!
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        minMaxValues()
        player1.HungerTimer()
        player1.WarmthTimer()
        player1.LoveTimer()
        player1.HapinessTimer()
        setBar()
        UpdateTimer()
    }
    
    
    
    @IBAction func ReturnToMain(sender: AnyObject) {
        dinoMain = DinoMain(nibName: "DinoMain", bundle: nil)
        self.presentViewController(dinoMain, animated: true, completion: nil)
    }
    
    
    func setBar(){
        loveBar.value = Float(player1.love)
        warmthBar.value = Float(player1.warmth)
        happinessBar.value = Float(player1.happiness)
        hungerBar.value = Float(player1.hunger)
        setStatus()
        
    }
    
    func setStatus(){
        loveStatus.text = "Love: \(loveBar.value) "
        happinessStatus.text = "Happiness: \(happinessBar.value) "
        warmthStatus.text = "Warmth: \(warmthBar.value) "
        hungerStatus.text = "Hunger: \(hungerBar.value)"
        
    }
    
    
    func UpdateTimer(){
        if updateTimer != nil{
            updateTimer.invalidate()
        }
        updateTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(DinoStats.setBar), userInfo: nil, repeats: true)
    }
    
    func minMaxValues(){
        loveBar.maximumValue = Float(player1.MAX_LOVE)
        loveBar.minimumValue = Float(player1.MIN_LOVE)
        happinessBar.maximumValue = Float(player1.MAX_HAPPINESS)
        happinessBar.minimumValue = Float(player1.MIN_HAPPINESS)
        hungerBar.maximumValue = Float(player1.MAX_HUNGER)
        hungerBar.minimumValue = Float(player1.MIN_HUNGER)
        warmthBar.maximumValue = Float(player1.MAX_WARMTH)
        warmthBar.minimumValue = Float(player1.MIN_WARMTH)
    }
    
}
