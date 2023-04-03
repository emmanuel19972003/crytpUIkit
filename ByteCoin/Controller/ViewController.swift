//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CoinManagerDelegate {
    
    
    var coinManager = CoinManager()
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPiker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate = self// lo mismo del piker, el que se va a encargar de decir quien hace las cosas esta misma view
        currencyPiker.dataSource = self// de donde viene la informacion, el self hace referencia a esta clase no al piker, los datos los asigno desde aca == ViewController()
        currencyPiker.delegate = self
    }
    
    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = price
            self.currencyLabel.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {//al ser un protoclo el pickerView se encarga de llenar los parametros, es puede unsar de manera interana
        return coinManager.currencyArray[row]
    }//asi llena los espacios
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
        print(coinManager.getCoinPrice(for: selectedCurrency))
        coinManager.getCoinPrice(for: selectedCurrency)
    }//así los eleije, esta coqueto
    
}

