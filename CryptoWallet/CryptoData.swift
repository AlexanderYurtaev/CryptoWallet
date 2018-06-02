//
//  CryptoData.swift
//  CryptoWallet
//
//  Created by Юртаев Александр on 31.05.2018.
//  Copyright © 2018 Юртаев Александр. All rights reserved.
//

import Foundation


struct CurrencyData: Decodable {
    //var id:String
    var name:String?
    var symbol:String?
    var rank:String?
    var price_usd:String?
    var percent_change_24h:String?
    var yourValue:String?
    var yourCapitalization:String?
}


class GetAPIDataFor {
    
    var currencyData = [CurrencyData]()
    let coinMarketCapURL = "https://api.coinmarketcap.com/v1/ticker/?start=0&limit=6"
    
    public func getLatestData(completed: @escaping () -> ()) {
        
        guard let url = URL(string: coinMarketCapURL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("!!!! NO DATA")
                return
            }
            /*if let response = response {
             //print(response)
             }*/
            if let error = error {
                print("!!! error in dataTask - ", error)
                return
            }
            
            do {
                //This is decoding of JSON array
                let receivedData = try JSONDecoder().decode([CurrencyData].self, from: data)
                self.currencyData = receivedData
                print("in do: ", self.currencyData[0])
                print("in do array contains elements ", self.currencyData.count)
                DispatchQueue.main.async {
                    completed()
                }
                
            }
            catch let error {
                print("!!! Error in CATCH  ", error)
            }
            }.resume()
   /*
        for item in currencyData {
            print("ITEM", item)
        }
        */
        
    }
    
    //reloadTable - название параметра, который  в этом случае является функцией.
    //вызываем этот параметр в DispatchQueue.main. параметром являетс яфункция перезагрузки таблицы.
    func myFetchJSON(reloadTable: @escaping () -> ()) {
        guard let url = URL(string: coinMarketCapURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            
            do {

                let receivedData = try JSONDecoder().decode([CurrencyData].self, from: data)
                self.currencyData = receivedData
                print(self.currencyData.count)
                DispatchQueue.main.async {
                    reloadTable()
                }
                
                
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
            }.resume()
        
        
    }
}


