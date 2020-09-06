//
//  ViewController.swift
//  PlusOuMoinsIOS
//
//  Created by Andréa on 06/09/2020.
//  Copyright © 2020 Andréa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myBtn : UIButton!
    @IBOutlet var newGameBTN : UIButton!
    @IBOutlet var myField : UITextField!
    @IBOutlet var answ : UITextField!
    @IBOutlet var tryF : UITextField!
    
    var nbTry = 0
    var rand: UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rand = arc4random_uniform(100) + 1
        print(rand.description)
        tryF.text = nbTry.description
        myField.text = "Entrez un nombre entre 1 et 100"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clicAnsw(sender : UIButton){
        
        nbTry++
        
        if(UInt32(answ.text!) == nil){
            myField.text = "Veuillez entrer un nombre"
        }
        else if(UInt32(answ.text!) > rand){
            myField.text = "C'est moins"
        }
        else if(UInt32(answ.text!) < rand){
            myField.text = "C'est Plus"
        }
        else{
            myField.text = "Gagné en " + nbTry.description + " coups"
            myBtn.enabled = false
            answ.enabled = false
        }
        answ.text = nil
        tryF.text = nbTry.description
    }
    
    @IBAction func clicNG(sender : UIButton){
        rand = arc4random_uniform(101)
        nbTry = 0
        print(rand.description)
        myBtn.enabled = true
        answ.enabled = true
        tryF.text = nbTry.description
        myField.text = "Entrez un nombre entre 1 et 100"
        answ.text = nil

    }



}

