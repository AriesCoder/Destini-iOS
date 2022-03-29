//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!

    @IBOutlet weak var choice1View: UIButton!
    @IBOutlet weak var choice2View: UIButton!
    
    let storyBrain = StoryBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }

    @IBAction func choiceMade(_ sender: UIButton) {
        var choice: String
        if sender == choice1View{
            choice = choice1View.currentTitle!
        }else{
            choice = choice2View.currentTitle!
        }
        let story = storyBrain.updateStory(choice)
        updateUI(story: story)

    }
    
    func setupView(){
        self.view.backgroundColor = .blue
        textLabel.font = .systemFont(ofSize: 24)
        textLabel.textColor = .white
        textLabel.layer.cornerRadius = 15
        
        choice1View.backgroundColor = .red
        choice1View.layer.cornerRadius = 15
        choice1View.setTitleColor(.white, for: .normal)
        
        choice2View.backgroundColor = UIColor(red: 23/255, green: 107/255, blue: 34/255, alpha: 1.0)
        choice2View.layer.cornerRadius = 15
        choice2View.setTitleColor(.white, for: .normal)
        updateUI(story: storyBrain.stories[0])
            
    }
    
    func updateUI(story: Story){
        let storyDes = story.choice1Destination
        if  storyDes != 0{
            choice2View.isHidden = false
            textLabel.text = story.title
            choice1View.setTitle(story.choice1, for: .normal)
            choice2View.setTitle(story.choice2, for: .normal)
        }else{
            textLabel.text = story.title
            choice1View.setTitle(story.choice1, for: .normal)
            choice2View.isHidden = true
        }
        
    }

}

