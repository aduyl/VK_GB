//
//  UniversalTableViewCell.swift
//  openWeatherMap
//
//  Created by Rodion Molchanov on 15.04.2021.
//

import UIKit

class UniversalTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var myYellowView = UIView()
    @IBAction func releaseButton(_ sender: Any) {
        UIImageView.animate(withDuration: 3.0, animations: {
            self.myImageView.frame.size.width -= 6
            self.myImageView.frame.size.height -= 6
            self.myImageView.frame.origin.x += 3
            self.myImageView.frame.origin.y += 3
            self.myImageView.alpha = 1
        })
    }
    @IBAction func touchedButton(_ sender: Any) {
        UIImageView.animate(withDuration: 3.0, animations: {
            self.myImageView.frame.size.width += 6
            self.myImageView.frame.size.height += 6
            self.myImageView.frame.origin.x -= 3
            self.myImageView.frame.origin.y -= 3
            self.myImageView.alpha = 0.9
        })
    }
    
    var saveUser: User?
    var saveGroup: Group?
    
    let chagableImage = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
    
    
    func clearCell() {
        myImageView.image = nil
        titleLabel.text = nil
        descriptionLabel.text = nil
        saveUser = nil
        saveGroup = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
        myImageView.layer.cornerRadius = 50
        
        
        myImageView.layer.shadowColor = UIColor.black.cgColor
        myImageView.layer.shadowOpacity = 0.99
        myImageView.layer.shadowRadius = 100
        myImageView.layer.shadowOffset = CGSize.zero
        
        
    }

    override func prepareForReuse() {
        clearCell()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func configure(user: User) {
        titleLabel.text = user.name
        
        descriptionLabel.text = String(user.age) + " лет."
        
        if let avatar = user.avatar {
            myImageView.image = avatar
        }
        
        saveUser = user
        
    }
    
    func configure(group: Group) {
        titleLabel.text = group.name
        descriptionLabel.text = group.description
        myImageView.image = group.groupImage
        saveGroup = group
    }
    
    
}
