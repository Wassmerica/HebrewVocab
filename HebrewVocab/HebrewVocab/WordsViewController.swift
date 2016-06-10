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

    @IBAction func button1Action(sender: UIButton) {
        if let currWords = currentWords, titleLabel = button1.titleLabel{
            if titleLabel.text == currWords[0].hebrew {
                button1.setTitle(currWords[0].english, forState: .Normal)
            } else {
                button1.setTitle(currWords[0].hebrew, forState: .Normal)
            }
        }
    }

    @IBAction func button2Action(sender: UIButton) {
        if let currWords = currentWords, titleLabel = button2.titleLabel{
            if titleLabel.text == currWords[1].hebrew {
                button2.setTitle(currWords[1].english, forState: .Normal)
            } else {
                button2.setTitle(currWords[1].hebrew, forState: .Normal)
            }
        }
    }
    
    @IBAction func button3Action(sender: UIButton) {
        if let currWords = currentWords, titleLabel = button3.titleLabel{
            if titleLabel.text == currWords[2].hebrew {
                button3.setTitle(currWords[2].english, forState: .Normal)
            } else {
                button3.setTitle(currWords[2].hebrew, forState: .Normal)
            }
        }
    }
    
    @IBAction func button4Action(sender: UIButton) {
        if let currWords = currentWords, titleLabel = button4.titleLabel{
            if titleLabel.text == currWords[3].hebrew {
                button4.setTitle(currWords[3].english, forState: .Normal)
            } else {
                button4.setTitle(currWords[3].hebrew, forState: .Normal)
            }
        }
    }
    
    @IBAction func button5Action(sender: UIButton) {
        if let currWords = currentWords, titleLabel = button5.titleLabel{
            if titleLabel.text == currWords[4].hebrew {
                button5.setTitle(currWords[4].english, forState: .Normal)
            } else {
                button5.setTitle(currWords[4].hebrew, forState: .Normal)
            }
        }
    }
    
    @IBAction func button6Action(sender: UIButton) {
        if let currWords = currentWords, titleLabel = button6.titleLabel{
            if titleLabel.text == currWords[5].hebrew {
                button6.setTitle(currWords[5].english, forState: .Normal)
            } else {
                button6.setTitle(currWords[5].hebrew, forState: .Normal)
            }
        }
    }
    
    //MARK: - Other Button Methods
    
    @IBAction func moreWordsAction(sender: UIButton) {
        currentWords = WordRepository.getNextSetOfWords()
        setUpWords()
    }
    
    @IBAction func backAction(sender: UIButton) {
        currentWords = WordRepository.getLastSetOfWords()
        setUpWords()
    }
    
    @IBAction func langSwitchAction(sender: UIButton) {
        let defaults = NSUserDefaults.standardUserDefaults()
        if sender.titleLabel?.text == "English" {
            defaults.setBool(true, forKey: "langToUse")
            sender.setTitle("Hebrew", forState: UIControlState.Normal)
            setUpWords()
        } else {
            defaults.setBool(false, forKey: "langToUse")
            sender.setTitle("English", forState: UIControlState.Normal)
            setUpWords()
        }
    }
    
    //MARK: - Helper Methods
    private func useEnglish() -> Bool {
        let defaults = NSUserDefaults.standardUserDefaults()
        let langToUse = defaults.boolForKey("langToUse")
        if langToUse == true {
            return true
        } else {
            return false
        }
    }
    
    private func setUpWords() {
        if useEnglish() {
            if let currWords = currentWords {
                button1.setTitle(currWords[0].english, forState: .Normal)
                button2.setTitle(currWords[1].english, forState: .Normal)
                button3.setTitle(currWords[2].english, forState: .Normal)
                button4.setTitle(currWords[3].english, forState: .Normal)
                button5.setTitle(currWords[4].english, forState: .Normal)
                button6.setTitle(currWords[5].english, forState: .Normal)
            }
        } else {
            if let currWords = currentWords {
                button1.setTitle(currWords[0].hebrew, forState: .Normal)
                button2.setTitle(currWords[1].hebrew, forState: .Normal)
                button3.setTitle(currWords[2].hebrew, forState: .Normal)
                button4.setTitle(currWords[3].hebrew, forState: .Normal)
                button5.setTitle(currWords[4].hebrew, forState: .Normal)
                button6.setTitle(currWords[5].hebrew, forState: .Normal)
            }
        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let currGroup = defaults.integerForKey("currentGroup")
        if currGroup == 0 {
            backButton.hidden = true
        } else {
            backButton.hidden = false
        }
        navBar.topItem?.title = "Group \(currGroup)"
    }

    private func adjustScreenForDevice() {
        if UIDevice().userInterfaceIdiom == .Phone {
            switch UIScreen.mainScreen().nativeBounds.height {
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

