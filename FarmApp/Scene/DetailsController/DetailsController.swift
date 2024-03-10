//
//  DetailsController.swift
//  FarmApp
//
//  Created by Alparslan Cafer on 10.03.24.
//

import UIKit

class DetailsController: UIViewController {

    @IBOutlet private var detailsProductCollection: UICollectionView!
    
    
    private var cellId = "\(CollectionViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureCell()
        
     }
    
    private func configureCell() {
        detailsProductCollection.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
        
    }
    
    private func configure() {
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension DetailsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: detailsProductCollection.frame.width, height: detailsProductCollection.frame.height)
    }
}
