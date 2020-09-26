//
//  CoinManager.swift
//  ByteCoin
//
//  Created by ahmet on 26.09.2020.
//  Copyright © 2020 ahmetguvez. All rights reserved.
//

import Foundation
protocol CoinManagerProtocol {
    func didUpdateCoin(coinModel:CoinModel)
}
struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "49024EA5-750A-46AE-B300-27CCACC9341F"
    
    var delegate : CoinManagerProtocol?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(coinString:String){
        
        let url = "\(baseURL)/\(coinString)?apikey=\(apiKey)"
        
        let request = URL(string: url)
        
        let session = URLSession.shared
        
        let decoder = JSONDecoder()
        
        
        let task = session.dataTask(with: request!, completionHandler: {data,response,error in
            //  print(response!)
            
            do {
                
                let json = try decoder.decode(CoinModel.self, from: data!)
                print(json.rate!)
                self.delegate?.didUpdateCoin(coinModel: json)
                
            } catch {
                print(error)
            }
            
        })
        
        task.resume()
    }
    
    
}
