//
//  CryptoCurrency.swift
//  CryptoMoneyPrice
//
//  Created by sys on 21.06.2022.
//

import Foundation

struct CryptoCurrency : Decodable {
    
    let currency : String // Burdaki değişken adıyla apideki gelen verinin isminin aynı olması gerekiyor.
    let price : String // Burdaki değişken adıyla apideki gelen verinin isminin aynı olması gerekiyor.
}
