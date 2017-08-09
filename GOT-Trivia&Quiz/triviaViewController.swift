//
//  triviaViewController.swift
//  GOT-Trivia&Quiz
//
//  Created by Kieran Foley on 09/08/2017.
//  Copyright © 2017 Kieran Foley. All rights reserved.
//

import UIKit

class triviaViewController: UIViewController {
    
    var factArray = ["The actress that plays Sansa Stark adopted her Direwolf in real life.", "You can study Game of Thrones at Harvard University.", "Daenerys was doused in so much fake blood during the horse heart eating scene that she got stuck to a toilet seat during a break.", "The actor who plays the 13 year old Jojan Reed was actually 22 in real life.", "After filming his death scene, Sean Bean played football with his replica head.", "Only two episodes have no deaths."]
    
    var count = 1;
    
    @IBOutlet var mainMenuOutlet: UIButton!
    
    @IBOutlet var nextFactOutlet: UIButton!
    
    @IBOutlet var factLabel: UILabel!
    
    
    @IBAction func nextFactButton(_ sender: UIButton) {
        
        factLabel.text = factArray[count]
        
        count += 1;
        
        if (count == factArray.count) {
            count = 0;
        }
    }
    

    @IBAction func mainMenuButton(_ sender: UIButton) {
        performSegue(withIdentifier: "mainMenu", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainMenuOutlet.layer.cornerRadius = 5;
        mainMenuOutlet.layer.borderWidth = 4;
        mainMenuOutlet.layer.borderColor = UIColor.lightGray.cgColor;
        mainMenuOutlet.backgroundColor = UIColor.clear;
        mainMenuOutlet.setTitleColor(UIColor.white, for: .normal);
        mainMenuOutlet.setTitle("Main Menu", for: .normal);
        
        nextFactOutlet.layer.cornerRadius = 5;
        nextFactOutlet.layer.borderWidth = 4;
        nextFactOutlet.layer.borderColor = UIColor.lightGray.cgColor;
        nextFactOutlet.backgroundColor = UIColor.clear;
        nextFactOutlet.setTitleColor(UIColor.white, for: .normal);
        nextFactOutlet.setTitle("Next Fact", for: .normal);
        
        factLabel.text = factArray[0];
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}