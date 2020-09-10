//
//  UtilitiesManager.swift
//  IniPariwisata
//
//  Created by IndratS on 14/08/20.
//  Copyright © 2020 IndratSaputra. All rights reserved.
//

import Foundation

struct UtilitiesManager {
    let version: String = "1.0"
    let nameCreated: String = "Indrat Saputra"
    let origin: String = "Jakarta"
    let provider: String = "Dicoding"
    let descriptionApp: String = "\n\n\nAplikasi ini dibuat dengan tujuan memberikan informasi kepada pengguna mengenai tempat - tempat pariwisata yang berada di Indonesia. Pariwisata di indonesia cukup banyak dan beragam, disetiap wilayah mempunyai wisata - wisata yang menarik untuk dikunjungi."
    
    
    // fungsi untuk memberikan informasi versi aplikasi
    var getVersionApp: String {
        return "Application Version : \(version)"
    }
    
    // fungsi untuk memberikan informasi deskripsi
    var getDescription: String {
        let name =      "Nama       : \(nameCreated)\n"
        let origin =    "Asal          : \(self.origin)\n"
        let provider =  "Peserta    : \(self.provider)\n"
        let all = name + origin + provider + descriptionApp
        
        return all
    }
}
