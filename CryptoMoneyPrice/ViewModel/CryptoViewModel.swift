//
//  CryptoViewModel.swift
//  CryptoMoneyPrice
//
//  Created by sys on 21.06.2022.
//

import Foundation

struct CryptoListViewModel {
    
    let cryptoCurrencyList : [CryptoCurrency]
    
   /* func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count // Dizinin içinde kaç tane cryptocurrency var o dönecek.
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
        
    } extension olarak aşağıya taşındı. */
    
}

extension CryptoListViewModel {
    
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count // Dizinin içinde kaç tane cryptocurrency var o dönecek.
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
        
    }
    
}

struct CryptoViewModel {
    
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        
        return self.cryptoCurrency.currency
    }
    var price : String {
        
        return self.cryptoCurrency.price
    }
    
}
