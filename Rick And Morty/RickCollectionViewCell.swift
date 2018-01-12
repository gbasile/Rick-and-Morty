import UIKit

class RickCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func configure(with cellPresentable: CellPresentable) {
        imageView.image = UIImage.init(named: cellPresentable.imageName)
        nameLabel.text = cellPresentable.name
        descriptionLabel.text = cellPresentable.description
    }
}
