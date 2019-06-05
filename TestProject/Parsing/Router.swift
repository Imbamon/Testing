//
//  Router.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 17/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import Foundation
import UIKit

class Router {
    func routeToDetailedPost(fromVc: UIViewController,elem:Element) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondVc
        
        vc.labelId = String(elem.id!)
        vc.labelText = elem.body
        fromVc.navigationController?.pushViewController(vc, animated: true)
        
}
}
