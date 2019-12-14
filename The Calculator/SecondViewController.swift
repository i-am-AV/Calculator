//
//  SecondViewController.swift
//  The Calculator
//
//  Created by  Alexander on 30.11.2019.
//  Copyright © 2019  Alexander. All rights reserved.
//

import UIKit


//enum Operation2 {
//    case digit(Int)
//    case plus
//}
//
//protocol Calc {
//    func process(_ op: O)
//}
//
//class ViewControllerViewModel {
//    
//}


class SecondViewController: UIViewController, CalculatorModelOutput {
    func display(string: String) {
        
    }
    
    var model: CalculatorModel!
    var buttons: [CollectionViewCellModel] = .generate()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
      let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
      collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
//        let vm = CollectionViewCellModel(titleText: "\(indexPath.item)", backgroundColor: indexPath.item % 2 == 0 ? .orange : .darkGray)
        
        let vm = buttons[indexPath.item]
        
        cell.viewModel = vm
        
        return cell
    }
    
//    все ячейки находятся в очереди (которые не видны на экране)
//    dequeue достать ячейку из очереди
}

extension SecondViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vm = buttons[indexPath.item]
        print(vm.titleText)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width / 4)
        print("size - \(size)")
        return CGSize(width: size, height: size)
    }
}
