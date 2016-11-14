//
//  WordsViewController.swift
//  HebrewVocab
//
//  Created by michael wasserman on 2016-05-26.
//  Copyright © 2016 michael wasserman. All rights reserved.
//

import UIKit

class WordsViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tabBarItem = UITabBarItem(title: "Words", image: nil, tag: 0)
    }
    
    @IBOutlet weak var containerToConstraint: NSLayoutConstraint!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var currentWords:Array<HWord>?
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentWords = WordRepository.getCurrentSetOfWords()
        setUpWords()
        adjustScreenForDevice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Word Button Methods

    @IBAction func button1Action(_ sender: UIButton) {
        if let currWords = currentWords, let titleLabel = button1.titleLabel{
            if titleLabel.text == currWords[0].hebrew {
                button1.setTitle(currWords[0].english, for: UIControlState())
            } else {
                button1.setTitle(currWords[0].hebrew, for: UIControlState())
            }
        }
    }

    @IBAction func button2Action(_ sender: UIButton) {
        if let currWords = currentWords, let titleLabel = button2.titleLabel{
            if titleLabel.text == currWords[1].hebrew {
                button2.setTitle(currWords[1].english, for: UIControlState())
            } else {
                button2.setTitle(currWords[1].hebrew, for: UIControlState())
            }
        }
    }
    
    @IBAction func button3Action(_ sender: UIButton) {
        if let currWords = currentWords, let titleLabel = button3.titleLabel{
            if titleLabel.text == currWords[2].hebrew {
                button3.setTitle(currWords[2].english, for: UIControlState())
            } else {
                button3.setTitle(currWords[2].hebrew, for: UIControlState())
            }
        }
    }
    
    @IBAction func button4Action(_ sender: UIButton) {
        if let currWords = currentWords, let titleLabel = button4.titleLabel{
            if titleLabel.text == currWords[3].hebrew {
                button4.setTitle(currWords[3].english, for: UIControlState())
            } else {
                button4.setTitle(currWords[3].hebrew, for: UIControlState())
            }
        }
    }
    
    @IBAction func button5Action(_ sender: UIButton) {
        if let currWords = currentWords, let titleLabel = button5.titleLabel{
            if titleLabel.text == currWords[4].hebrew {
                button5.setTitle(currWords[4].english, for: UIControlState())
            } else {
                button5.setTitle(currWords[4].hebrew, for: UIControlState())
            }
        }
    }
    
    @IBAction func button6Action(_ sender: UIButton) {
        if let currWords = currentWords, let titleLabel = button6.titleLabel{
            if titleLabel.text == currWords[5].hebrew {
                button6.setTitle(currWords[5].english, for: UIControlState())
            } else {
                button6.setTitle(currWords[5].hebrew, for: UIControlState())
            }
        }
    }
    
    //MARK: - Other Button Methods
    
    @IBAction func moreWordsAction(_ sender: UIButton) {
        currentWords = WordRepository.getNextSetOfWords()
        setUpWords()
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        currentWords = WordRepository.getLastSetOfWords()
        setUpWords()
    }
    
    @IBAction func langSwitchAction(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        if sender.titleLabel?.text == "English" {
            defaults.set(true, forKey: "langToUse")
            sender.setTitle("Hebrew", for: UIControlState())
            setUpWords()
        } else {
            defaults.set(false, forKey: "langToUse")
            sender.setTitle("English", for: UIControlState())
            setUpWords()
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
    
    fileprivate func setUpWords() {
        if useEnglish() {
            if let currWords = currentWords {
                button1.setTitle(currWords[0].english, for: UIControlState())
                button2.setTitle(currWords[1].english, for: UIControlState())
                button3.setTitle(currWords[2].english, for: UIControlState())
                button4.setTitle(currWords[3].english, for: UIControlState())
                button5.setTitle(currWords[4].english, for: UIControlState())
                button6.setTitle(currWords[5].english, for: UIControlState())
            }
        } else {
            if let currWords = currentWords {
                button1.setTitle(currWords[0].hebrew, for: UIControlState())
                button2.setTitle(currWords[1].hebrew, for: UIControlState())
                button3.setTitle(currWords[2].hebrew, for: UIControlState())
                button4.setTitle(currWords[3].hebrew, for: UIControlState())
                button5.setTitle(currWords[4].hebrew, for: UIControlState())
                button6.setTitle(currWords[5].hebrew, for: UIControlState())
            }
        }
        
        let defaults = UserDefaults.standard
        let currGroup = defaults.integer(forKey: "currentGroup")
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

