//
//  CoinModel.swift
//  ByteCoin
//
//  Created by ahmet on 26.09.2020.
//  Copyright © 2020 ahmetguvez. All rights reserved.
//

import Foundation

struct CoinModel:Decodable{
    
    var rate:Double?
    let asset_id_quote:String?
    let asset_id_base : String?
    
}
