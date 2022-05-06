//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Amel Mallem on 5/5/22.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    
    // Mark : Labels and UIImage used inside cell
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    // Mark : cell identfier
    static let identifier = "WeatherTableViewCell"
    let day = [Daily]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // Mark : Configure Cell data
    func configure( with model : Daily){
        self.highTempLabel.textAlignment = .center
        self.lowTempLabel.textAlignment = .center
        self.lowTempLabel.text = "\((Int(model.temp.min - 273) * (9 / 5) + 32))°"
        self.highTempLabel.text = "\((Int(model.temp.max - 273) * (9 / 5) + 32))°"
        dayLabel.text = getDays(date:Date(timeIntervalSince1970: .init(Double(model.dt))))
        
        self.iconImageView.contentMode = .scaleAspectFit
        
        for x in model.weather{
            let icon =  x.main.lowercased()
            if icon.contains("cloud"){
                self.iconImageView.image = UIImage(named: "cloud")
            }else if icon.contains("rain"){
                self.iconImageView.image = UIImage(named: "rain")
            } else {
                self.iconImageView.image = UIImage(named: "clear")
            }
        }
    }
    
    
    // Mark : Get Days For Dates
    func getDays(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let day = dateFormatter.string(from: date)
        return day
    }
    
}
