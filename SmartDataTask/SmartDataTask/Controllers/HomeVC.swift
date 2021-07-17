//
//  HomeVC.swift
//  SmartDataTask
//
//  Created by Nidhi on 16/07/21.
//

import UIKit

class HomeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: ACTIONS
    @IBAction func actionNext(_ sender: UIButton) {
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "ImagesVC") as! ImagesVC
        nextVc.titleStr = "Images"
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }
    
    
    
}
