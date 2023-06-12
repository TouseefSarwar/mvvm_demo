//
//  ViewModel.swift
//  MVVM_Demo
//
//  Created by Touseef Sarwar on 09/06/2023.
//

import Foundation

final class ProductViewModel{
    
    var products : [Product] = []
    var eventHandler : ((_ event: Event) -> Void )?
    
    func fetchProduct(){
        APIController.shared.fetchData { response in
            switch response{
            case .success(let product):
                self.products = product
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
    
}



extension ProductViewModel {

    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
        
    }

}
