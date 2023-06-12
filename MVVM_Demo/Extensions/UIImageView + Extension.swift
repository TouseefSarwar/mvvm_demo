//
//  UIImageView + Extension.swift
//  MVVM_Demo
//
//  Created by Touseef Sarwar on 09/06/2023.
//

import UIKit
import Kingfisher

extension UIImageView{
    
    func setImage(_ urlString: String){
        guard let url = URL.init(string: urlString) else{ return }
        
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
