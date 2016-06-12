//
//  PhraseViewController.swift
//  HebrewVocab
//
//  Created by michael wasserman on 2016-06-05.
//  Copyright © 2016 michael wasserman. All rights reserved.
//

import UIKit

class PhraseViewController: UIViewController {
    
    @IBOutlet weak var containerToConstraint: NSLayoutConstraint!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Word Button Methods
    
    @IBAction func button1Action(sender: UIButton) {

    }
    
    @IBAction func button2Action(sender: UIButton) {

    }
    
    @IBAction func button3Action(sender: UIButton) {
        /*if let currWords = currentWords, titleLabel = button3.titleLabel{
            if titleLabel.text == currWords[2].hebrew {
                button3.setTitle(currWords[2].english, forState: .Normal)
            } else {
                button3.setTitle(currWords[2].hebrew, forState: .Normal)
            }
        }*/
    }

    @IBAction func moreAction(sender: UIButton) {

    }
    
    @IBAction func backAction(sender: UIButton) {

    }
    
    @IBAction func langSwitchAction(sender: UIButton) {

    }

}
