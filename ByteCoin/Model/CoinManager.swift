//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "69F52BC8-F054-4D21-BE36-6543C5EE1904"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        guard let myUrl = URL(string: urlString) else { return }
        //Crear la secion!!!
        let sesion = URLSession(configuration: .default)
        // Crer la task
        let task = sesion.dataTask(with: myUrl) { data, respuesat, error in
            if error != nil {
                print(error)
                return
            }
            let dataAsString = String(data: data!, encoding: .utf8)
            print(dataAsString)
        }
        //HAcer la task
        task.resume()
    }
    
}

struct crytoData: Codable {
    let cryptoType: String?
    let coinType: String?
    let rate: Double?
    
    enum CodingKeys: String, CodingKey {
        
        case cryptoType = "asset_id_base"
        case coinType = "asset_id_quote"
        case rate
    }
}

