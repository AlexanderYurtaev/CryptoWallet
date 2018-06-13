//
//  CryptoDetailsViewController.swift
//  CryptoWallet
//
//  Created by Юртаев Александр on 20.05.2018.
//  Copyright © 2018 Юртаев Александр. All rights reserved.
//

import UIKit

class CryptoDetailsViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var detailedCryptoImage: UIImageView!
    @IBOutlet weak var detailedCryptoName: UILabel!
    @IBOutlet weak var detailedCryptoPrice: UILabel!
    @IBOutlet weak var detailedSymbolLabel: UILabel!
    @IBOutlet weak var myCoinTextField: UITextField!

    
    var name = ""
    var image = UIImage()
    var cryptoDataExemplar: GetAPIDataFor = GetAPIDataFor()
    var currencyDetailView: CurrencyData?
    var currencyTest = CurrencyData()
    //var myCoins =
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedCryptoName.text = currencyTest.name
        detailedCryptoImage.image = UIImage(named: currencyTest.name!)
        detailedCryptoPrice.text = (currencyTest.price_usd! + "$")
        detailedSymbolLabel.text = currencyTest.symbol
        print(currencyTest)
        setupNavigationBar()
        myCoinTextField.delegate = self
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupNavigationBar() {
        //title = currencyTest.name
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @IBAction func onPressedButtonGetData(_ sender: Any) {
        cryptoDataExemplar.myFetchJSON {
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveMycoinInroCurrencyData()
        myCoinTextField.resignFirstResponder()
        myCoinTextField.textColor = UIColor(red: 91.0/255.0, green: 187.0/255.0, blue: 159.0/255.0, alpha: 1.0)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        saveMycoinInroCurrencyData()
        myCoinTextField.resignFirstResponder()
    }
    
    func saveMycoinInroCurrencyData() {
        let myCoin = myCoinTextField.text
        print(cryptoDataExemplar.currencyData[0])
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
