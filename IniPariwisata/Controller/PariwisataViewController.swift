//
//  FirstViewController.swift
//  IniPariwisata
//
//  Created by IndratS on 13/08/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import UIKit
import CLTypingLabel

class PariwisataViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    private let pariwisataManager = PariwisataManager()
    var id: Int?
    var nameWilayah: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTitleApp()
        
        let nib = UINib(nibName: "PariwisataTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "parwisataCellIdentifier")
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        customTableView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        id = pariwisataManager.pariwisataWilayahList[indexPath.row].id
        nameWilayah = pariwisataManager.pariwisataWilayahList[indexPath.row].name
        performSegue(withIdentifier: "goToTouristSites", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToTouristSites"){
            if let controller = segue.destination as? PariwisataTSViewController {
                controller.idSites = id
                controller.sitesName = nameWilayah
            }
        }
    }
    
}

extension PariwisataViewController {
    
    private func loadTitleApp(){
        let name = "Pariwisata Indonesia"
        titleLabel.text = name
    }
}

extension PariwisataViewController: UITableViewDelegate, UITableViewDataSource{
    
    // fungsi untuk membaca jumlah row table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pariwisataManager.pariwisataWilayahList.count
    }
    
    // fungsi untuk memberikan data ke cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "parwisataCellIdentifier", for: indexPath) as! PariwisataTableViewCell
        let name =  pariwisataManager.pariwisataWilayahList[indexPath.row].name
        cell.labelBackground.text = name
        cell.imageBackground.image = UIImage(named: name)

        return  cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // deklarasi tinggi cell row
        return 201
    }
    
    
    private func customTableView(){
        //custom corner radius di table
        myTableView.layer.cornerRadius = 20
    }
    
    
}

