//
//  ViewController.swift
//  HebrewVocab
//
//  Created by michael wasserman on 2016-05-26.
//  Copyright © 2016 michael wasserman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    var currentWords:Array<HWord>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentWords = WordRepository.getCurrentSetOfWords()
        setUpWords()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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
    
    @IBAction func moreWordsAction(sender: UIButton) {
        currentWords = WordRepository.getNextSetOfWords()
        setUpWords()
    }
    
    @IBAction func shuffleAction(sender: UIButton) {
    }
    
    private func setUpWords() {
        if let currWords = currentWords {
            button1.setTitle(currWords[0].hebrew, forState: .Normal)
            button2.setTitle(currWords[1].hebrew, forState: .Normal)
            button3.setTitle(currWords[2].hebrew, forState: .Normal)
            button4.setTitle(currWords[3].hebrew, forState: .Normal)
            button5.setTitle(currWords[4].hebrew, forState: .Normal)
            button6.setTitle(currWords[5].hebrew, forState: .Normal)
        }
    }

}

