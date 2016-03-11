//
//  ViewController.swift
//  JFCardSelectionViewControllerExmaple
//
//  Created by Jeremy Fox on 3/1/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

import UIKit
import JFCardSelectionViewController

class UserSelectionViewController: JFCardSelectionViewController {
    
    let cards = [
        User(name: "John Adams", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Adel", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Aden", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Adil", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Baar", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Babel", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Backman", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Bair", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Ballow", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Bally", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Bane", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Barney", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Bartin", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Bartlett", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Barts", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Bate", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Cagan", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Cage", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Cain", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Cake", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Calaway", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Cali", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Call", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Callen", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Callez", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Callum", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Campa", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Candill", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Caney", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Cantey", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Caplin", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Fabel", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Fabry", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Fagen", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Fain", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Fair", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Faley", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Falls", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Farag", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Farrier", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Fata", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Faul", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Fausett", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Fay", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Finell", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Flom", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Form", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Fox", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Frees", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Jack", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Jain", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Janey", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Kadi", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Kaeo", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Kahn", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Kain", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Kelter", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Ker", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Kester", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Kher", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Mace", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Maga", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Majmundar", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Maliska", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Manin", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Manis", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Mano", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar McDay", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven McGathy", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Meiser", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Meitz", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Meja", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Mekee", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Mena", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Menor", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Meysembourg", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Mier", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Paik", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Painter", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Palitti", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Pannenbacker", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Paramore", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Parkhill", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Parson", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Penegar", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Penaha", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Penick", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Peralez", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Pernice", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Radder", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Radeke", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Raden", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Ragas", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Rake", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Rams", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Ranweiler", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Rappenecker", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Rathbone", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Raven", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Reagle", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Redditt", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Rehder", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Reist", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Riley", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Sachs", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Sake", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Salisbury", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Salvia", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Samway", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Sands", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Santander", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Schink", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Schum", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Tango", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Tatge", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Teran", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Valerie", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Vero", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Vicini", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "John Wary", photoURL: "https://lh5.googleusercontent.com/-ZadaXoUTBfs/AAAAAAAAAAI/AAAAAAAAAGA/19US52OmBqc/photo.jpg", address: "123 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jim Washabaugh", photoURL: "http://www.geek.com/wp-content/uploads/2010/07/Scott-Forstall-Executive-profile-image.jpg", address: "234 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jane Westen", photoURL: "http://fuerteventura-surf.com/assets/img/homeGuestHostImages/client(3).jpg", address: "345 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Avery Widney", photoURL: "http://thumbs.dreamstime.com/z/profile-face-young-woman-isolated-white-background-38923522.jpg", address: "456 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Jamar Younger", photoURL: "https://s3.amazonaws.com/um-profile-pics/1/profile_half.JPG?1348755125", address: "567 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Steven Zahner", photoURL: "http://www.bu.edu/polisci/files/2016/01/mock-profile.jpg", address: "678 Main St", city: "Atlanta", state: "GA", zip: 12345),
        User(name: "Dude Zeilder", photoURL: "http://zblogged.com/wp-content/uploads/2015/11/5.png", address: "789 Main St", city: "Atlanta", state: "GA", zip: 12345)
    ]
    
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
        
        // Call `reloadData()` once you are ready to display your `CardPresentable` data or when there have been changes to that data that need to be represented in the UI.
        reloadData()
    }
}

extension UserSelectionViewController: JFCardSelectionViewControllerDataSource {
    
    func numberOfCardsForCardSelectionViewController(cardSelectionViewController: JFCardSelectionViewController) -> Int {
        return cards.count
    }
    
    func cardSelectionViewController(cardSelectionViewController: JFCardSelectionViewController, cardForItemAtIndexPath indexPath: NSIndexPath) -> CardPresentable {
        return cards[indexPath.row]
    }
    
}

extension UserSelectionViewController: JFCardSelectionViewControllerDelegate {
    
    func cardSelectionViewController(cardSelectionViewController: JFCardSelectionViewController, didSelectCardAction cardAction: CardAction, forCardAtIndexPath indexPath: NSIndexPath) {
        let card = cards[indexPath.row]
        if let action = card.actionOne where action.title == cardAction.title {
            print("----------- \nCard action fired! \nAction Title: \(cardAction.title) \nIndex Path: \(indexPath)")
        }
        if let action = card.actionTwo where action.title == cardAction.title {
            print("----------- \nCard action fired! \nAction Title: \(cardAction.title) \nIndex Path: \(indexPath)")
        }
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
    
    var placeholderImage: UIImage? {
        return UIImage(named: "default")
    }
    
    var titleText: String {
        return name
    }
    
    var dialLabel: String {
        guard let lastString = titleText.componentsSeparatedByString(" ").last else { return "" }
        return String(lastString[lastString.startIndex])
    }
    
    var detailText: String {
        return "\(address) \n\(city), \(state) \(zip)"
    }
    
    var actionOne: CardAction? {
        return CardAction(title: "Call")
    }
    
    var actionTwo: CardAction? {
        return CardAction(title: "Email")
    }
    
}

