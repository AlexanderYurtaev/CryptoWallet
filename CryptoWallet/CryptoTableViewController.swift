//
//  CryptoTableViewController.swift
//  CryptoWallet
//
//  Created by Юртаев Александр on 20.05.2018.
//  Copyright © 2018 Юртаев Александр. All rights reserved.
//

import UIKit

class CryptoTableViewController: UITableViewController {
    //var dataCollection = ["Bitcoin", "Ethereum", "Ripple", "Nem", "Waves", "IOTA"]
    var cryptoData = GetAPIDataFor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //вызываю функцию получения данных по API с параметром: перезагрузка таблицы
        //если вызывать эту функцию без параметра то таблица загружается пустая, т.к. данные не успели "получиться"
        cryptoData.myFetchJSON(reloadTable: self.tableView.reloadData)
        //cryptoData.myFetchJSON() {
        //    self.tableView.reloadData()
       // }
        setupNavigationBar()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Top 10 coins"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        //setTitleVerticalPositionAdjustment
        //navigationController?.navigationBar.setTitleVerticalPositionAdjustment(6, for: .default)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //определяем сколько строк будет в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return self.dataCollection.count\
        return cryptoData.currencyData.count
    }

    //заполняем ячейку таблицы данными
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCellIdentifier", for: indexPath) as! CryptoTableViewCell
        // Configure the cell...

        let data = cryptoData.currencyData[indexPath.row]
        cell.cryptoName.text = data.name
        
        //конфертим Стринг во флоат
        let tempFloatPrice = (data.price_usd! as NSString).floatValue
        //конфертим флоат в стринг с ограничение количества символов после запятой
        cell.cryptoPrice.text = (String(format: "%.2f", tempFloatPrice) + "$")
        //cell.cryptoPrice.textColor = UIColor.green
        
        let temp24hChangeFloat = (data.percent_change_24h! as NSString).floatValue
        if temp24hChangeFloat > 0 {
            cell.crypto24hChangeLabel.text = (data.percent_change_24h! + "%")
            cell.crypto24hChangeLabel.textColor = UIColor(red: 91.0/255.0, green: 197.0/255.0, blue: 159.0/255.0, alpha: 1.0)
        }
        else {
            cell.crypto24hChangeLabel.text = (data.percent_change_24h! + "%")
            cell.crypto24hChangeLabel.textColor = UIColor.red
        }
        
        
        cell.cryptoImage.image = UIImage(named: data.name!)
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    //передача данных на другой UI view и переход к другому UIview
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //performSegue(withIdentifier: "goToDetails", sender: dataCollection[indexPath.row])
        performSegue(withIdentifier: "goToDetails", sender: cryptoData.currencyData[indexPath.row])
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    //Подготовка данный к передаче на другой UI View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //let svc = segue.destination as! CryptoDetailsViewController
        //svc.name = (sender as? String)!
        let dataToPass = segue.destination as! CryptoDetailsViewController
        dataToPass.currencyTest = (sender as! CurrencyData)
        
        
        
    }
    
 
}
