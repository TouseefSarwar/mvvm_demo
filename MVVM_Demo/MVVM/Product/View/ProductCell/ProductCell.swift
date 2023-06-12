//
//  ProductCell.swift
//  MVVM_Demo
//
//  Created by Touseef Sarwar on 09/06/2023.
//

import UIKit

class ProductCell: UITableViewCell {

    static let identifier = "ProductCell"
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productHeading: UILabel!
    @IBOutlet weak var productCetagory: UILabel!
    @IBOutlet weak var productRating: UIButton!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var buyBtn: UIButton!
    
    var product : Product? {
        didSet{
            productConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productConfiguration(){
        guard let product else{ return }
//        productImage.image
        productHeading.text = product.title
        productCetagory.text = product.category
        productDescription.text = product.description
        productRating.setTitle("\(product.rating.rate)", for: .normal)
        productPrice.text = "\(product.price)"
        productImage.setImage(product.image)
    }
    
}
