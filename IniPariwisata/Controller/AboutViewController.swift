//
//  SecondViewController.swift
//  IniPariwisata
//
//  Created by IndratS on 13/08/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageMe: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    
    private let utilitiesManager = UtilitiesManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData(){
        //load data ke masing ui
        imageMe.image = UIImage(named: "me")
        versionLabel.text = utilitiesManager.getVersionApp
        descriptionLabel.text = utilitiesManager.getDescription
    }


}

