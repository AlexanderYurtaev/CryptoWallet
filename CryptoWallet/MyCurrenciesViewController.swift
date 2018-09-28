//
//  MyCurrenciesViewController.swift
//  CryptoWallet
//
//  Created by Юртаев Александр on 23.09.2018.
//  Copyright © 2018 Юртаев Александр. All rights reserved.
//

import UIKit

class MyCurrenciesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell2") as! CryptoTableViewCell
        
        return cell
    }
    
    
   @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addCurrencyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
       tableView.dataSource = self
        tableView.delegate = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

}
    
    
    
    func setupNavigationBar() {
        navigationItem.title = "My crypto currencies"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        //setTitleVerticalPositionAdjustment
        //navigationController?.navigationBar.setTitleVerticalPositionAdjustment(6, for: .default)
    }
    
    @IBAction func onPressedButtonAddCurrencyButton(_ sender: Any) {
    }
    
    
    

    
    
    
    

}

