//
//  DinoStats.swift
//  raiseYourDino
//
//  Created by Meitar Basson on 09/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//


import UIKit

class DinoStats: DinoMain {
    
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
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minMaxValues()
        player.HungerTimer()
        player.WarmthTimer()
        player.LoveTimer()
        player.HapinessTimer()
        setBar()
        UpdateTimer()
    }
    
    
    
    @IBAction func ReturnToMain(sender: AnyObject) {
        dinoMain = DinoMain(nibName: "DinoMain", bundle: nil)
        self.presentViewController(dinoMain, animated: true, completion: nil)
    }
    
    
    func setBar(){
        loveBar.value = Float(player.love)
        warmthBar.value = Float(player.warmth)
        happinessBar.value = Float(player.happiness)
        hungerBar.value = Float(player.hunger)
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
        loveBar.maximumValue = Float(player.MAX_LOVE)
        loveBar.minimumValue = Float(player.MIN_LOVE)
        happinessBar.maximumValue = Float(player.MAX_HAPPINESS)
        happinessBar.minimumValue = Float(player.MIN_HAPPINESS)
        hungerBar.maximumValue = Float(player.MAX_HUNGER)
        hungerBar.minimumValue = Float(player.MIN_HUNGER)
        warmthBar.maximumValue = Float(player.MAX_WARMTH)
        warmthBar.minimumValue = Float(player.MIN_WARMTH)
    }
    
}
