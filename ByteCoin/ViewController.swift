//
//  ViewController.swift
//  ByteCoin
//
//  Created by ahmet on 26.09.2020.
//  Copyright © 2020 ahmetguvez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var byteCoinLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        coinManager.delegate = self
        
    }
}


extension ViewController:UIPickerViewDataSource,UIPickerViewDelegate,CoinManagerProtocol {
    func didUpdateCoin(coinModel: CoinModel) {
        
        DispatchQueue.main.async {
            self.byteCoinLabel.text = "\(coinModel.rate!)"
            print(coinModel.rate!)
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selected = coinManager.currencyArray[row]
        coinManager.getCoinPrice(coinString: selected)
        
        print(selected)
        
    }
    
    
    
    
}
