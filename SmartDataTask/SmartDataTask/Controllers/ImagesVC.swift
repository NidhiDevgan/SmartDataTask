//
//  ImagesVC.swift
//  SmartDataTask
//
//  Created by Nidhi on 16/07/21.
//

import UIKit

class ImagesVC: UIViewController {
    
   //MARK: OUTLETS
    @IBOutlet weak var imagesCollView: UICollectionView!
    
    var titleStr: String?
    var imagesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = titleStr
        
    }
    
    
    
}


//MARK: COLLECTION VIEW DELEGATES AND DATASOURCES

extension ImagesVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollCell", for: indexPath) as! ImageCollCell
        
        
        let imageUrl = URL(string: self.imagesArray[indexPath.item])!
      //  DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.imgView.image = image
                        cell.cancelBtn.isHidden = false
                    }
                }
            }
      //  }
        
        cell.cancelBtn.tag = indexPath.row
        cell.cancelBtn.addTarget(self, action:#selector(cancelButtonClick(sender:)), for: .touchUpInside)
        
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCell", for: indexPath) as? HeaderCell {
            sectionHeader.plusBtn.addTarget(self, action:#selector(cellButtonClick), for: .touchUpInside)
            return sectionHeader
        }
        return UICollectionReusableView()
    }
  
  //MARK: ACTIONS
    
    @objc func cellButtonClick() {
        
        if imagesArray.count < 10 {
            print(imagesArray.count)
            imagesArray.append("https://s3.amazonaws.com/lg-dev.kdlineguide.com/images/\(imagesArray.count + 1).jpg")
        }
        
        imagesCollView.reloadData()
    }
    
    @objc func cancelButtonClick(sender: UIButton) {
        imagesArray.remove(at: sender.tag)
        imagesCollView.reloadData()
    }
    
}
