//
//  Properties.swift
//  raiseYourDino
//
//  Created by Meitar Basson on 09/06/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import Foundation

class Properties{
    
    // Class Properties
    private var _love: Int!
    private var _exp: Double!
    private var _hunger: Int!
    private var _lvl: Int!
    private var _warmth: Int!
    private var _happiness: Int!
    
    
    // Constants
    let MAX_LOVE = 50 // Start
    let MIN_LOVE = 0 // Die
    let START_EXP = 0.0 // Out of 100%
    let MIN_HUNGER = 0 // Out Of 100% - Not hungry
    let MAX_HUNGER = 100 // Feed him
    let MIN_WARMTH = 0 // Out of 100% - Need to warm
    let MAX_WARMTH = 100 // Dino is warm
    let MIN_HAPPINESS = 0 // Dino is sad
    let MAX_HAPPINESS = 100 // Happy
    let MIN_LVL = 1 // Egg
    let MAX_LVL = 2 // Dino
    
    //Variables
    var hungerTimer: NSTimer!
    var loseExpTimer: NSTimer!
    var warmthTimer: NSTimer!
    var happinessTimer: NSTimer!
    var loveTimer: NSTimer!
    
    // Computed Properties
    
    var love: Int{
        get{
            return _love
        }set{
            _love = love
        }
    }
    
    var exp: Double{
        get{
            return _exp
        }set{
            _exp = exp
        }
    }
    
    var hunger: Int{
        get{
            return _hunger
        }set{
            _hunger = hunger
        }
    }
    
    var lvl: Int{
        get{
            return _lvl
        }set{
            _lvl = lvl
        }
    }
    
    var happiness: Int{
        get{
            return _happiness
        }
        set{
            _happiness = happiness
        }
    }
    
    var warmth: Int{
        get{
            return _warmth
        }set{
            _warmth = warmth
        }
    }
    
    init(){
        self._love = MAX_LOVE / 2
        self._exp = START_EXP
        self._hunger = MIN_HUNGER
        self._lvl = MIN_LVL
        self._hunger = MIN_HUNGER
        self._happiness = MAX_HAPPINESS
        self._warmth = MAX_WARMTH
        //      HungerTimer()
        //      WarmthTimer()
        //      LoseExpTimer()
    }
    
    func isHungry() -> Bool{
        if self._hunger > MAX_HUNGER / 2 {
            return true
        }
        return false
    }
    
    func isCold() -> Bool{
        if self._warmth < MAX_WARMTH / 2  {
            return true
        }
        return false
    }
    
    func isNotLoved() -> Bool{
        if self._love < MAX_LOVE / 2 {
            return true
        }
        return false
    }
    
    func isNotHappy() -> Bool{
        if self._happiness < MAX_HAPPINESS / 2 {
            return true
        }
        return false
    }
    
    //    @objc func loseExp(){
    //        if self._hunger >= 100 {
    //            self._exp = self._exp - 2
    //            self._hunger = 80
    //        }
    //    }
    
    
    @objc func addHunger(){
        self._hunger = self._hunger + 4
        if hunger >= 100 {
            hunger = 100
        }
    }
    
    @objc func loseWarmth(){
        self._warmth = self._warmth - 33
        if self._warmth == 1 || self._warmth < 0{
            self._warmth = 0
        }
    }
    
    @objc func loseHappiness(){
        self._happiness = self._happiness - 25
        if self._warmth < 0 {
            self._warmth = 0
        }
    }
    
    @objc func loseLove(){
        self._love = self._love - 3
        if self._love < 0{
            self._love = 0
        }
    }
    
    //    func LoseExpTimer(){
    //        if loseExpTimer != nil{
    //            loseExpTimer.invalidate()
    //        }
    //        loseExpTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(Properties.loseExp), userInfo: nil, repeats: true)
    //    }
    //
    
    
    func HungerTimer(){
        if hungerTimer != nil{
            hungerTimer.invalidate()
        }
        hungerTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(Properties.addHunger) , userInfo: nil, repeats: true)
    }
    
    func WarmthTimer(){
        if warmthTimer != nil{
            warmthTimer.invalidate()
        }
        warmthTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(Properties.loseWarmth), userInfo: nil, repeats: true)
    }
    
    func HapinessTimer(){
        if happinessTimer != nil{
            happinessTimer.invalidate()
        }
        happinessTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(Properties.loseHappiness), userInfo: nil, repeats: true)
    }
    
    func LoveTimer(){
        if loveTimer != nil{
            loveTimer.invalidate()
        }
        loveTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(Properties.loseLove), userInfo: nil, repeats: true)
    }
    
}