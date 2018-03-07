//
//  HeroViewController.swift
//  Demo URL
//
//  Created by Grant Gaurav on 2/19/18.
//  Copyright © 2018 Grant Gaurav. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

class HeroViewController: UIViewController {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var attributeLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var legsLbl: UILabel!
    @IBOutlet weak var rolesLbl: UILabel!
    
    var hero: heroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = hero?.localized_name
        attributeLbl.text = hero?.primary_attr
        attackLbl.text = hero?.attack_type
        legsLbl.text = "\((hero?.legs)!)"
        var urlString = "https://api.opendota.com" + (hero?.img)!
        var url = URL(string : urlString)
        imageView.downloadedFrom(url: url!)
        urlString = "https://api.opendota.com" + (hero?.icon)!
        url = URL(string : urlString)
        iconView.downloadedFrom(url: url!)
        rolesLbl.text = hero?.roles[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
