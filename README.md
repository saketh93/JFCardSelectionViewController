JFCardSelectionViewController
===========

A fancy collection style view controller that was inspired by this Profile Card mockup: https://dribbble.com/shots/1458441-Profile-Card/attachments/216311

What It Looks Like:
------------------

![Example](https://dl.dropboxusercontent.com/u/55388810/card_selection_controller.gif)

How To Use It:
-------------

### Basic Example

First create a new class that subclasses `JFCardSelectionViewController`
```swift
import UIKit
import JFCardSelectionViewController

class UserSelectionViewController: JFCardSelectionViewController {
    
    var cards: [User]? {
      didSet {
        // Call `reloadData()` once you are ready to display your `CardPresentable` data or when there have been changes to that data that need to be represented in the UI.
        reloadData()
      }
    }
    
    override func viewDidLoad() {
        
        // You can set a permanent background by setting a UIImage on the `backgroundImage` property. If not set, the `backgroundImage` will be set using the currently selected Card's `imageURLString`.
        // backgroundImage = UIImage(named: "bg")
        
        // Set the datasource so that `JFCardSelectionViewController` can get the CardPresentable data you want to dispaly
        dataSource = self
        
        // Set the delegate so that `JFCardSelectionViewController` can notify the `delegate` of events that take place on the focused CardPresentable.
        delegate = self
        
        // Set the desired `JFCardSelectionViewSelectionAnimationStyle` to either `.Slide` or `.Fade`. Defaults to `.Fade`.
        selectionAnimationStyle = .Slide
        
        // Call up to super after configuring your subclass of `JFCardSelectionViewController`. Calling super before configuring will cause undesirable side effects.
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        /*
        NOTE: If you are displaying an instance of `JFCardSelectionViewController` within a `UINavigationController`, you can use the code below to hide the navigation bar. This isn't required to use `JFCardSelectionViewController`, but `JFCardSelectionViewController` was designed to be used without a UINavigationBar.
        let image = UIImage()
        let navBar = navigationController?.navigationBar
        navBar?.setBackgroundImage(image, forBarMetrics: .Default)
        navBar?.shadowImage = image
        */
        
        // Load your dynamic CardPresentable data
        cards = [
          User(name: "Jennifer Adams", photoURL: "https://s-media-cache-ak0.pinimg.com/736x/5d/43/0b/5d430bd15603971c939fcc9a4358a35f.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
          User(name: "Jim Adel", photoURL: "http://a3.files.blazepress.com/image/upload/c_fit,cs_srgb,dpr_1.0,q_80,w_620/MTI4OTkyOTM4OTM5MTYxMDU0.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
          User(name: "Jane Aden", photoURL: "https://s-media-cache-ak0.pinimg.com/236x/b7/65/2d/b7652d8c4cf40bc0b1ebac37bb254fcb.jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
          User(name: "Avery Adil", photoURL: "http://boofos.com/wp-content/uploads/2013/02/Celebrity-Portraits-by-Andy-Gotts-10.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
          User(name: "Jamar Baar", photoURL: "https://s-media-cache-ak0.pinimg.com/736x/85/e3/8a/85e38ab9e480790e216c4f9359bb677f.jpg", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
          User(name: "Steven Babel", photoURL: "http://blog.picr.com/wp-content/uploads/2015/09/Andy-Gotts.jpeg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345)
        ]
    }
}
```

Second, conform to the `JFCardSelectionViewControllerDelegate` and `JFCardSelectionViewControllerDataSource` protocols so that you can provide the CardPresentable data to the `JFCardSelectionViewController` and to receive callbacks of touch events in the action buttons.
```swift
extension UserSelectionViewController: JFCardSelectionViewControllerDataSource {
    
    func numberOfCardsForCardSelectionViewController(cardSelectionViewController: JFCardSelectionViewController) -> Int {
        return cards?.count ?? 0
    }
    
    func cardSelectionViewController(cardSelectionViewController: JFCardSelectionViewController, cardForItemAtIndexPath indexPath: NSIndexPath) -> CardPresentable {
        return cards?[indexPath.row] ?? User(name: "", photoURL: "", address: "", city: "", state: "", zip: 0)
    }
    
}

extension UserSelectionViewController: JFCardSelectionViewControllerDelegate {
    
    func cardSelectionViewController(cardSelectionViewController: JFCardSelectionViewController, didSelectCardAction cardAction: CardAction, forCardAtIndexPath indexPath: NSIndexPath) {
        guard let card = cards?[indexPath.row] else { return }
        if let action = card.actionOne where action.title == cardAction.title {
            print("----------- \nCard action fired! \nAction Title: \(cardAction.title) \nIndex Path: \(indexPath)")
        }
        if let action = card.actionTwo where action.title == cardAction.title {
            print("----------- \nCard action fired! \nAction Title: \(cardAction.title) \nIndex Path: \(indexPath)")
        }
    }
    
}
```

Then, in the models you want to be presentable within the card selection view controller, just have them conform to the `CardPresentable` protocol.
```swift
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
    
    var placeholderImage: UIImage? {
        return UIImage(named: "default")
    }
    
    var titleText: String {
        return name
    }
    
    // This is used to tell the dial at the bottom of the UI which letter to point tofor this card
    var dialLabel: String {
        guard let lastString = titleText.componentsSeparatedByString(" ").last else { return "" }
        return String(lastString[lastString.startIndex])
    }
    
    var detailTextLineOne: String {
        return address
    }
    
    var detailTextLineTwo: String {
        return "\(city), \(state) \(zip)"
    }
    
    var actionOne: CardAction? {
        return CardAction(title: "Call")
    }
    
    var actionTwo: CardAction? {
        return CardAction(title: "Email")
    }
    
}
```

### Cocoapods

`coming soon`

License
-------
Copyright (c) 2012 Jeremy Fox ([jeremyfox.me](http://www.jeremyfox.me)). All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

