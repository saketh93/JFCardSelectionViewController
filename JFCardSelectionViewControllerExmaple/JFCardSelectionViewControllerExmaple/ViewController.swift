//
//  ViewController.swift
//  JFCardSelectionViewControllerExmaple
//
//  Created by Jeremy Fox on 3/1/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit
import JFCardSelectionViewController

class ViewController: UIViewController {

    let cards = [
        User(name: "John Smith", photoURL: "https://www.cheme.cornell.edu/engineering2/customcf/iws_news/uploads/alabi__reis.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Smith", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Smith", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Smith", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Smith", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Smith", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Smith", photoURL: "http://vertassets.blob.core.windows.net/image/439e18aa/439e18aa-bc29-45cd-9c91-e0b18b5b0dcd/ed_miseta.jpg", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345)
    ]
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        title = ""
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        title = "Example"
        let navBar = navigationController?.navigationBar
        navBar?.setBackgroundImage(nil, forBarMetrics: .Default)
        navBar?.shadowImage = nil
    }
    
    @IBAction func presentCardSelectionVCAction(sender: AnyObject) {
        let cardSelectionVC = MyCardSelectionViewController()
        cardSelectionVC.dataSource = self
        cardSelectionVC.backgroundImage = UIImage(named: "bg")
        navigationController?.pushViewController(cardSelectionVC, animated: true)
    }
}

extension ViewController: JFCardSelectionViewControllerDataSource {
    
    func numberOfCardsForCardSelectionViewController(cardSelectionViewController: JFCardSelectionViewController) -> Int {
        return cards.count
    }
    
    func cardSelectionViewController(cardSelectionViewController: JFCardSelectionViewController, cardForItemAtIndexPath indexPath: NSIndexPath) -> CardPresentable {
        return cards[indexPath.row]
    }
    
}

class MyCardSelectionViewController: JFCardSelectionViewController {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let image = UIImage()
        let navBar = navigationController?.navigationBar
        navBar?.setBackgroundImage(image, forBarMetrics: .Default)
        navBar?.shadowImage = image
        reloadData()
    }
}


//----------------


struct User {
    var name: String
    var photoURL: String
    var address: String
    var city: String
    var state: String
    var zip: Int
}

extension User: CardPresentable {
    
    var imageURLString: String {
        return photoURL
    }
    
    var titleText: String {
        return name
    }
    
    var detailText: String {
        return "\(address) \n\(city), \(state) \(zip)"
    }
    
    var actions: [CardAction]? {
        return [
            CardAction(title: "action one") {
                print("Action One Fired!")
            },
            CardAction(title: "action two") {
                print("Action Two Fired!")
            }
        ]
    }
    
}

