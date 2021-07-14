//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Chavika Kodithuwakku on 2021-06-10.
//

import UIKit

class ViewController: UIViewController {
    
    //add a image view to show a random photo at one time
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemOrange
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //change the background color
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        //size fo the view
        //we can change the poe=sition of this image view by change the 'x' and 'y'
        //imageView.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        //center the image
        imageView.center = view.center
        
        //add button
        view.addSubview(button)
//        button.frame = CGRect(
//            x: 20,
//            y: view.frame.size.height-50-view.safeAreaInsets.bottom,
//            width: view.frame.size.width-40, height: 50)
        
        //call the add image function
        getRandomPhoto()
        
        //add objc fuction to the button
        button.addTarget(self, action: #selector(didTapButton),
                         for: .touchUpInside)
        
        
    }
    
    //add button with layout view to set safe area
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 20,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 50)
    }
    
    //add function to the button
    @objc func didTapButton (){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    //get random photo from the internet
    func getRandomPhoto(){
        let urlString =
            "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        //create image from the url data
        imageView.image = UIImage(data: data)
    }
    
}

