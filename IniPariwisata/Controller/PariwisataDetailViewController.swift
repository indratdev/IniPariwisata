//
//  PariwisataDetailViewController.swift
//  IniPariwisata
//
//  Created by IndratS on 13/08/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit

class PariwisataDetailViewController: UIViewController {
    @IBOutlet weak var imageSites: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var opneingLabel: UILabel!
    @IBOutlet weak var ticketLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var id: Int?
    var name,opening,location,descriptionSite,entranceTicket:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    
    private func loadUI(){
        //load data
        imageSites.image = UIImage(named: name!)
        nameLabel.text = name!
        descriptionLabel.text = descriptionSite
        locationLabel.text = "Lokasi : \n\(location!)"
        opneingLabel.text = "Jam Buka : \n\(opening!)"
        ticketLabel.text = "Harga Tiket Masuk : \n\(entranceTicket!)"
        
        //customize button back
        backButton.layer.cornerRadius = 20
    }
    
    // fungsi tombol kembali
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
