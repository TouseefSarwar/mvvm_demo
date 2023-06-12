//
//  ViewController.swift
//  MVVM_Demo
//
//  Created by Touseef Sarwar on 09/06/2023.
//

import UIKit

class ProductViewController: UIViewController {

    
    @IBOutlet weak var productTableView: UITableView!
    
    
    private var productViewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Configure()
    }


}

extension ProductViewController{
    func Configure() {
        initViewModel()
        ObserveEvent()
    }
    
    func initViewModel(){
        productTableView.register(UINib(nibName: ProductCell.identifier, bundle: nil), forCellReuseIdentifier: ProductCell.identifier)
        productViewModel.fetchProduct()
    }
    
    
    func ObserveEvent(){
        productViewModel.eventHandler = { [weak self] event in
            guard let self else{ return }
            switch event{
            case .loading:
                print("Loading....")
            case .dataLoaded:
                print("Loaded...!")
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .stopLoading:
                print("Stop Loading....")
            case .error(let error):
                print(error)
            }
            
        }
        
    }
}


//MARK: - TableView Datasource

extension ProductViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.productViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else{
            return UITableViewCell()
        }
        cell.product = self.productViewModel.products[indexPath.row]
        
        
        return cell
    }
    
    
}
