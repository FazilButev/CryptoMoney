//
//  ViewController.swift
//  CryptoMoneyPrice
//
//  Created by sys on 21.06.2022.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self

        self.colorArray = [
        
            UIColor(red: 0.1, green: 0.01, blue: 0.4, alpha: 1),
            UIColor(red: 0.2, green: 0.02, blue: 0.2, alpha: 1),
            UIColor(red: 0.3, green: 0.03, blue: 0.4, alpha: 1),
            UIColor(red: 0.4, green: 0.04, blue: 0.3, alpha: 1),
            UIColor(red: 0.5, green: 0.05, blue: 0.4, alpha: 1),
            UIColor(red: 0.6, green: 0.06, blue: 0.5, alpha: 1)
        
        
        ]
        
        getData()

    }
    
    func getData(){
        
        let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        WebService().downloadCurrencies(url: url) { cryptos in
            if let cryptos = cryptos {
                
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! CryptoTableViewCell
        let crytoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceText.text = crytoViewModel.price
        cell.currencyText.text = crytoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }
}

