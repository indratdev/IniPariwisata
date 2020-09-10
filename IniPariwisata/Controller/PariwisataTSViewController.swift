//
//  PariwisataTSViewController.swift
//  IniPariwisata
//
//  Created by IndratS on 13/08/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit

class PariwisataTSViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableviewTourisSites: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    
    private let pariswisataTSManager = PariwisataTSManager()
    
    var idSites: Int?
    var sitesName: String = ""
    var sitesNumber: Int = 0
    var indexData = [Int]()
    var finalId: Int?
    var finalNameSite,finalLocation,finalOpening,finalEntranceTicket,finalDescription:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TouristSitesTableViewCell", bundle: nil)
        tableviewTourisSites.register(nib, forCellReuseIdentifier: "touristSitesCell")
        
        loadUI()

        if let sites = idSites {
             getTouristSites(id: sites)
        }
        
        tableviewTourisSites.delegate = self
        tableviewTourisSites.dataSource = self
        
        // terima array nomor berapa saja untuk datanya
        indexData = pariswisataTSManager.getNumberArray(id: idSites!)
        
        
    }
    
    
    private func getTouristSites(id: Int){
        for pariwisata in pariswisataTSManager.pariwisataSitesList {
            if pariwisata.id == id {
                sitesNumber += 1
            }
        }
    }
    
    private func loadUI(){
        titleLabel.text = "Lokasi : \(sitesName)"
        tableviewTourisSites.reloadData()
        
        //customize button back
        backButton.layer.cornerRadius = 20
    }
    
    // fungsi kembali
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // fungsi passing data ke controller lain
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToPariwisataDetail"){
            if let controller = segue.destination as? PariwisataDetailViewController {
                controller.id = finalId
                controller.name = finalNameSite
                controller.opening = finalOpening
                controller.location = finalLocation
                controller.descriptionSite = finalDescription
                controller.entranceTicket = finalEntranceTicket
            }
        }
    }
}


extension PariwisataTSViewController: UITableViewDelegate, UITableViewDataSource {
    
    // dapetin baris table nya
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sitesNumber
    }
    
    // fungsi buat data yang akan ditampilkan di cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewTourisSites.dequeueReusableCell(withIdentifier: "touristSitesCell", for: indexPath) as! TouristSitesTableViewCell
        
        let name = pariswisataTSManager.pariwisataSitesList[indexData[indexPath.row]].nameSites
        cell.imageTouristSites.image = UIImage(named: name)
        cell.labelTouristSites.text = name
        
        return cell
    }
    
    // fungsi untuk atur tinggi cellnya
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 456
    }
    
    // store data ketika di klik
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        finalId = pariswisataTSManager.pariwisataSitesList[indexData[indexPath.row]].id
        finalNameSite = pariswisataTSManager.pariwisataSitesList[indexData[indexPath.row]].nameSites
        finalOpening = pariswisataTSManager.pariwisataSitesList[indexData[indexPath.row]].openingHours
        finalLocation = pariswisataTSManager.pariwisataSitesList[indexData[indexPath.row]].location
        finalDescription = pariswisataTSManager.pariwisataSitesList[indexData[indexPath.row]].description
        finalEntranceTicket = pariswisataTSManager.pariwisataSitesList[indexData[indexPath.row]].entranceTicket
        
        performSegue(withIdentifier: "goToPariwisataDetail", sender: nil)
    }
    
    
}

