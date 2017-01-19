//
//  PhraseViewController.swift
//  HebrewVocab
//
//  Created by michael wasserman on 2016-06-05.
//  Copyright © 2016 michael wasserman. All rights reserved.
//

import UIKit

class PhraseViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "Phrases", image: nil, tag: 0)
    }
    
    @IBOutlet weak var containerToConstraint: NSLayoutConstraint!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var currentPhrases:Array<HPhrase>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPhrases = PhraseRepository.getCurrentSetOfPhrases()
        setUpPhrases()
        adjustScreenForDevice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Phrase Button Methods
    
    @IBAction func button1Action(_ sender: UIButton) {
        if let currPhrases = currentPhrases, let titleLabel = button1.titleLabel{
            if titleLabel.text == currPhrases[0].hebrew {
                button1.setTitle(currPhrases[0].english, for: .normal)
            } else {
                button1.setTitle(currPhrases[0].hebrew, for: .normal)
            }
        }
    }
    
    @IBAction func button2Action(_ sender: UIButton) {
        if let currPhrases = currentPhrases, let titleLabel = button2.titleLabel{
            if titleLabel.text == currPhrases[1].hebrew {
                button2.setTitle(currPhrases[1].english, for: .normal)
            } else {
                button2.setTitle(currPhrases[1].hebrew, for: .normal)
            }
        }
    }
    
    @IBAction func button3Action(_ sender: UIButton) {
        if let currPhrases = currentPhrases, let titleLabel = button3.titleLabel{
            if titleLabel.text == currPhrases[2].hebrew {
                button3.setTitle(currPhrases[2].english, for: .normal)
            } else {
                button3.setTitle(currPhrases[2].hebrew, for: .normal)
            }
        }
    }
    
    //MARK: - Other Button Methods

    @IBAction func moreAction(_ sender: UIButton) {
        currentPhrases = PhraseRepository.getNextSetOfPhrases()
        setUpPhrases()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        currentPhrases = PhraseRepository.getLastSetOfPhrases()
        setUpPhrases()
    }
    
    @IBAction func langSwitchAction(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        if sender.titleLabel?.text == "English" {
            defaults.set(true, forKey: "langToUse")
            sender.setTitle("Hebrew", for: UIControlState())
            setUpPhrases()
        } else {
            defaults.set(false, forKey: "langToUse")
            sender.setTitle("English", for: UIControlState())
            setUpPhrases()
        }
    }
    
    //MARK: - Helper Methods
    
    fileprivate func useEnglish() -> Bool {
        let defaults = UserDefaults.standard
        let langToUse = defaults.bool(forKey: "langToUse")
        if langToUse == true {
            return true
        } else {
            return false
        }
    }
    
    fileprivate func setUpPhrases() {
        if useEnglish() {
            if let currPhrases = currentPhrases {
                button1.setTitle(currPhrases[0].english, for: UIControlState())
                button2.setTitle(currPhrases[1].english, for: UIControlState())
                button3.setTitle(currPhrases[2].english, for: UIControlState())
            }
        } else {
            if let currPhrases = currentPhrases {
                button1.setTitle(currPhrases[0].hebrew, for: UIControlState())
                button2.setTitle(currPhrases[1].hebrew, for: UIControlState())
                button3.setTitle(currPhrases[2].hebrew, for: UIControlState())
            }
        }
        
        let defaults = UserDefaults.standard
        let currGroup = defaults.integer(forKey: "currentGroupPhrase")
        if currGroup == 0 {
            backButton.isHidden = true
        } else {
            backButton.isHidden = false
        }
        navBar.topItem?.title = "Group \(currGroup)"
    }

    
    fileprivate func adjustScreenForDevice() {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 480:
                //iPhone Classic
                containerToConstraint.constant = 20
            case 960:
                //iPhone 4 or 4S
                containerToConstraint.constant = 20
            case 1136:
                //iPhone 5 or 5S or 5C
                containerToConstraint.constant = 20
            case 1334:
                //iPhone 6 or 6S
                containerToConstraint.constant = 60
            case 2208:
                //iPhone 6+ or 6S+
                containerToConstraint.constant = 100
            default:
                print("unknown")
            }
        }
    }


}
