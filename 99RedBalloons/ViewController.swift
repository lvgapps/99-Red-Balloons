//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Wale Anif on 10/27/14.
//  Copyright (c) 2014 Lavvo Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var balloonImageView: UIImageView!
    @IBOutlet weak var balloonLabel: UILabel!
    
    var balloon:[Balloon] = []
    var currentBalloonIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.balloonLabel.text = ". . ."
        
        //let imageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        //imageView.backgroundColor = UIColor.redColor()
        self.balloonImageView.layer.cornerRadius = 180.0
        self.balloonImageView.clipsToBounds = true
        
        self.create99Balloons()
        
        self.balloonImageView.image = self.balloon[self.currentBalloonIndex].image
        self.balloonLabel.text = "\(self.balloon[self.currentBalloonIndex].number) Balloon"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //Adding a comment here to test versioning
    }
    
    func create99Balloons(){
        var randomNumber = 0
        var imageName = ""
        var balloonObject:Balloon
        
        for count in 0...98 {
            randomNumber = Int(arc4random_uniform(UInt32(4)))
            
            switch randomNumber{
                case 0: imageName = "RedBalloon1.jpg"
                case 1: imageName = "RedBalloon2.jpg"
                case 2: imageName = "RedBalloon3.jpg"
                case 3: imageName = "RedBalloon4.jpg"
                default: imageName = "BerlinTVTower.jpg"
            }
            
            balloonObject = Balloon()
            balloonObject.number = count + 1
            balloonObject.image = UIImage(named: imageName)
            self.balloon.append(balloonObject)
            
            //println(self.balloon.count)
        }
        
        for x in self.balloon{
            println("\(x.number) | \(x.image)")
        }
    }
    @IBAction func doNextBtn(sender: UIButton) {
        println("Next Pressed New");
    }

    @IBAction func nextBtnPressed(sender: UIBarButtonItem) {
        println("Next Pressed");
    }
    @IBOutlet weak var nextButtonPressed: UIBarButtonItem!

    @IBAction func nextBtnPressedNew(sender: UIBarButtonItem) {
        println("Next Pressed New");
        if self.currentBalloonIndex < 98{
            self.currentBalloonIndex++
            println(self.currentBalloonIndex)
            self.balloonImageView.image = self.balloon[self.currentBalloonIndex].image
            self.balloonLabel.text = "\(self.balloon[self.currentBalloonIndex].number) Balloon"
        }
    }
}

