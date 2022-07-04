//
//  WebService.swift
//  CryptoMoneyPrice
//
//  Created by sys on 21.06.2022.
//

import Foundation

class WebService {
                                                              /* Modeli yazıyoruz.*/
                                        /* Data bir obje olarak değil array olarak geldiği için [] içine alıyoruz.*/
                    /* İnternet kesilmesi gibi bir durumda veri gelmemesi durumu olduğu için optional? yapıyoruz. */
    func downloadCurrencies(url : URL , completion : @escaping ([CryptoCurrency]?) ->() ) {
        
        // @escaping -> internetten bir veri ile calısıyorsanız ve o işlem bittikten sonra işleme devam etmesini istiyorsak bunu kullanıyoruz.
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil) // Hata varsa nil vermek mantıklı ama yoksa direk o datayı vermek gerekiyor.
            }else if let data = data {
                
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                print(cryptoList)
                
                completion(cryptoList) // Hata yoksa direk datayı veriyoruz.
            }
        }.resume()
    }
    
}
