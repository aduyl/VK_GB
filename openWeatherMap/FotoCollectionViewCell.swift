//
//  FotoCollectionViewCell.swift
//  openWeatherMap
//
//  Created by Rodion Molchanov on 15.04.2021.
//

import UIKit

class FotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    var check = true
    @IBOutlet weak var myNameView: UILabel!
    @IBOutlet weak var buttonLike: UIButton!
    @IBOutlet weak var likesCount: UILabel!
    
    @IBAction func touchButton(_ sender: Any) {
        if(check){
            self.buttonLike.setImage(UIImage(systemName:"heart.fill" ), for: UIControl.State.init())
            self.likesCount.text = "1 Likes"
            check = false
        }else{
            self.buttonLike.setImage(UIImage(systemName:"heart" ), for: UIControl.State.init())
            self.likesCount.text = "0 Likes"
            check = true
        }
        
        UIButton.animate(withDuration: 1.0, animations: {
            self.buttonLike.alpha = 0.6
            self.buttonLike.frame.size.width += 4
            self.buttonLike.frame.size.height += 4
            self.buttonLike.frame.origin.x -= 2
            self.buttonLike.frame.origin.y -= 2
        })
        
        UIButton.animate(withDuration: 1.0, animations: {
            self.buttonLike.alpha = 1
            self.buttonLike.frame.size.width -= 4
            self.buttonLike.frame.size.height -= 4
            self.buttonLike.frame.origin.x += 2
            self.buttonLike.frame.origin.y += 2
        })
    }
    
    
    @IBOutlet weak var myAvatarView: UIImageView!
    var saveImage: UIImage?
    
    func clearCell() {
        myImageView.image = nil
        saveImage = nil
        myAvatarView.image = nil
        myNameView.text = nil
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    
    func configure(image: UIImage, avatar: UIImage, name: String) {
        myImageView.image = image
        myAvatarView.image = avatar
        myNameView.text = name
    }

}
