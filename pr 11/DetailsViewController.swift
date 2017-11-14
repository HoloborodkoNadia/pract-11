//
//  DetailsViewController.swift
//  pr 11
//
//  Created by nadia on 08.11.17.
//  Copyright © 2017 nadia. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet private weak var ibimageView: UIImageView!
    @IBOutlet private weak var textView: UITextView!

    private var about: String = ""
    private var image: UIImage? = nil
    private var animalsName = ""
    private  var opis: String = ""
    
    func set(about: String, image: UIImage, animalsName: String, opis: String ) {
        self.about = about
        self.image = image
        self.animalsName = animalsName
        self.opis = opis
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = animalsName
        ibimageView.image = image
        textView.text = opis
        
    }
}
