//
//  AddCoinPopUpVC.swift
//  CryptoWallet
//
//  Created by Юртаев Александр on 23.12.2018.
//  Copyright © 2018 Юртаев Александр. All rights reserved.
//

import UIKit

class AddCoinPopUpVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var cryptoData = GetAPIDataFor()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "addCoinPopUpCell", for: indexPath) as! CryptoTableViewCell
        //let data = cryptoData.currencyData[indexPath.row]
        //cell.cryptoName.text = data.name
        //cell.cryptoImage.image = UIImage(named: data.name!)
        
        
        return cell
    }
    
    @IBOutlet weak var popUPTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUPTableView.layer.cornerRadius = 10
        popUPTableView.layer.masksToBounds = true
        popUPTableView.dataSource = self
        popUPTableView.delegate = self
        //cryptoData.myFetchJSON(reloadTable: self.popUPTableView.reloadData)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
