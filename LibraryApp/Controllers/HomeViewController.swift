//
//  HomeViewController.swift
//  LibraryApp
//
//  Created by Emmanuele Montagna on 15/10/22.
//

import UIKit



class HomeViewController: UIViewController {
    
    private var products: ProductsResponse = []
    
    private let collectionView  : UICollectionView = {
        let layout                      = UICollectionViewFlowLayout()
        layout.scrollDirection          = .vertical
        layout.itemSize                 = CGSize(width: UIScreen.main.bounds.width/2.1, height: 250)
        layout.minimumLineSpacing       = 1
        layout.minimumInteritemSpacing  = 1
        let cv                          = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CustomHomeCollectionViewCell.self, forCellWithReuseIdentifier: CustomHomeCollectionViewCell.identifier)
        return cv
    }()

    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "All Products"
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getProducts()



    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
    
    private func getProducts() {

        APICaller.shared.getAllProducts { result in
            switch result {
            case .success(let prods):
                    self.products = prods
                    DispatchQueue.main.async { [weak self] in
                        self?.collectionView.reloadData()
                    }
            case .failure(let erorr):
                print(erorr.localizedDescription)
            }
        }
    }

    
    


}

extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomHomeCollectionViewCell.identifier, for: indexPath) as? CustomHomeCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.configure(with: products[indexPath.row])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    

    
}


