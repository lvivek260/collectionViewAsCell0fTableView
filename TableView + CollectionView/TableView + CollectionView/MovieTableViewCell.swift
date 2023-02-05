//
//  MovieTableViewCell.swift
//  TableView + CollectionView
//
//  Created by Admin on 04/02/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    var moviesImage:[UIImage] = [UIImage]()
    var width:CGFloat?
    override func awakeFromNib() {
        super.awakeFromNib()
        movieCollectionView.dataSource = self
        movieCollectionView.dataSource = self
        movieCollectionView.backgroundColor = .black
        let nib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        movieCollectionView.register(nib, forCellWithReuseIdentifier: "collectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension MovieTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MovieCollectionViewCell
        cell.movieImage.image = moviesImage[indexPath.row]
        cell.layer.cornerRadius = 15
        return cell
    }
}
extension MovieTableViewCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 240)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
