//
//  CryptoDetailsViewController.swift
//  CryptoWallet
//
//  Created by Юртаев Александр on 20.05.2018.
//  Copyright © 2018 Юртаев Александр. All rights reserved.
//

import UIKit

class CryptoDetailsViewController: UIViewController {
    @IBOutlet weak var detailedCryptoImage: UIImageView!
    @IBOutlet weak var detailedCryptoName: UILabel!
    @IBOutlet weak var detailedCryptoPrice: UILabel!
    
    var name = ""
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedCryptoName.text = name
        detailedCryptoImage.image = UIImage(named: name)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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