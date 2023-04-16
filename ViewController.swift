//
//  ViewController.swift
//  TouristApp
//
//  Created by Aeman Rehman on 3/7/23.
//
// Disclaimer: This App is developed as an educational project.
// Certain materials are included under the fair use exemption of the U.S. Copyright
// Law and have been prepared according to the multimedia fair use guidelines and are
// restricted from further use.
//


import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    var mySoundFile:AVAudioPlayer!
    
    var LocationOA = [Locations]()
    var MosquesOA = [Mosques]()
    var FoodsOA = [Foods]()
    var AttractionsOA = [Attractions]()
    var RandOA = [Rand]()
    
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var desc: UILabel!
    
    
    @IBAction func Tripbtn(_ sender: Any) {
        let browserApp = UIApplication.shared
        let url = URL(string: "https://us.trip.com/travel-guide/destination/pakistan-100114/")
        browserApp.open(url!)

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let  urlObject = URL(fileURLWithPath: Bundle.main.path(forResource: "pak-instrument", ofType: "wav")!)
         
         mySoundFile = try? AVAudioPlayer(contentsOf:urlObject)
        
        initializeData()
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        pic.alpha = 0.5
        heading.alpha = 0.5
        desc.alpha = 0.5
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        UIView.animate(withDuration: 3, animations: {
            self.pic.alpha = 1
            self.heading.alpha = 1
            self.desc.alpha = 1
            
        })
        setRand()
    }
    
    
    func setRand(){
        var random = RandOA.randomElement()
        heading.text = random?.title
        desc.text = random?.descr
        desc.adjustsFontSizeToFitWidth = true
        pic.image = UIImage(named: random!.img)
        pic.layer.cornerRadius = 3
        pic.clipsToBounds = true
        pic.layer.borderWidth = 5
        pic.layer.borderColor = UIColor.yellow.cgColor
        mySoundFile.play()
    }
    
    @IBAction func Citiesbtn(_ sender: Any) {
        setLoc()
        
    }
    
    
    
    @IBAction func Foodbtn(_ sender: Any) {
        setFood()
    }
    

  
    @IBAction func Attractionsbtn(_ sender: Any) {
        setAttr()
    }
    
    

    @IBAction func Mosquesbtn(_ sender: Any) {
        setMos()
    }
    

    
   func setLoc(){
        var randomLoc = LocationOA.randomElement()
        heading.text = randomLoc?.Place
        desc.text = randomLoc?.PDesc
        desc.adjustsFontSizeToFitWidth = true
        pic.image = UIImage(named: randomLoc!.PImage)
        pic.layer.cornerRadius = 3
        pic.clipsToBounds = true
        pic.layer.borderWidth = 5
        pic.layer.borderColor = UIColor.yellow.cgColor
        mySoundFile.play()
    }
    
    
   func setMos(){
        var randomMos = MosquesOA.randomElement()
        heading.text = randomMos?.Mosque
        desc.text = randomMos?.MDesc
        pic.image = UIImage(named: randomMos!.MImage)
        pic.layer.cornerRadius = 3
        pic.clipsToBounds = true
        pic.layer.borderWidth = 5
        pic.layer.borderColor = UIColor.yellow.cgColor
       
        mySoundFile.play()
    
    }
    
   func setFood(){
        var randomFood = FoodsOA.randomElement()
        heading.text = randomFood?.Food
        desc.text = randomFood?.FDesc
        pic.image = UIImage(named: randomFood!.FImage)
        pic.layer.cornerRadius = 3
        pic.clipsToBounds = true
        pic.layer.borderWidth = 5
        pic.layer.borderColor = UIColor.yellow.cgColor
       
        mySoundFile.play()
    
    }
    
   func setAttr(){
        var randomAttr = AttractionsOA.randomElement()
        heading.text = randomAttr?.Attract
        desc.text = randomAttr?.ADesc
        pic.image = UIImage(named: randomAttr!.AImage)
        pic.layer.cornerRadius = 3
        pic.clipsToBounds = true
        pic.layer.borderWidth = 5
        pic.layer.borderColor = UIColor.yellow.cgColor
        
        mySoundFile.play()
    
    }

    
    
    func initializeData() {
        
        var l1 = Locations()
        l1.Place = "Lahore"
        l1.PDesc = "Pakistan's second largest city and the capital of the north-eastern Punjab province. It is widely considered the country's cultural capital. The heart of Lahore is the Walled or Inner City, a very densely populated area. Founded in legendary times, and a cultural centre for over a thousand years, Lahore has many attractions for the tourist."
        l1.PImage = "lahore.jpeg"
        LocationOA.append(l1)
        
        
        var l2 = Locations()
        l2.Place = "Karachi"
        l2.PDesc = "The largest city, with a growth rate at a global stage, and a sprawling huge metropolis grown into the commercial, transport and political hub. Known as the 'City of the Quaid' because Pakistan's founder, Muhammad Ali Jinnah, was born and raised here and 'City of Lights' for its round clock liveliness. It offers a lot from sunny, sandy beaches and scurf-infested old colonial buildings, to traditional bazaars and modern shopping malls"
        l2.PImage = "karachi.jpeg"
        LocationOA.append(l2)
        
        var l3 = Locations()
        l3.Place = "Islamabad"
        l3.PDesc = "A modern planned, well-maintanied and organised city, Islamabad is Pakistan's clean, calm, and green capital since 1963, with its name deriving from two words, Islam and abaad, meaning 'City of Islam'.It hosts a large number of diplomats, politicians and government employees, making it one of the nation's most cosmopolitan, developed and urbanized cities. People come from all over to enjoy its peaceful, noise-free atmosphere with a lot of greenery and nice surrounding scenery."
        l3.PImage = "islamabad.jpg"
        LocationOA.append(l3)
    
        var m1 = Mosques()
        m1.Mosque = "Badshahi Mosque"
        m1.MDesc = "This royal, Mughal era mosque is considered one of Lahore's most iconic landmark. It is the second largest mosque in Pakistan, located near the citadel Lahore Fort.  Created by Emperor Aurangzeb, it is the biggest and most beautiful mosque of that era, has an exterior that is decorated with carved red sandstone with marble inlay."
        m1.MImage = "badshahi.jpeg"
        MosquesOA.append(m1)
        
        var m2 = Mosques()
        m2.Mosque = "Masjid-e-Tooba"
        m2.MDesc = "Mosque with unique feature located in Karachi, Pakistan.  Also known as 'Gol(round) Masjid', it claims to be the largest single-dome mosque. It is entirely developed with white marble with a dome accompanied with low encircling wall no central pillars. A person talking on one side of the done can be listened at the other side. It is a beautiful and simple, yet classy mosque."
        m2.MImage = "tooba.jpg"
        MosquesOA.append(m2)
        
        var m3 = Mosques()
        m3.Mosque = "Faisal Masjid"
        m3.MDesc = "Located in Pakistan's capital city of Islamabad, it is the fifth-largest mosque in the world and the largest within South Asia. Inspired by Turkish architecture, its unique style consists of an eight-sided concrete shell shaped sloping roof, massive triangular prayer hall, and four minarets. The main tent-shaped hall’s interior is paved in white marble and embellished with mosaics and calligraphy."
        m3.MImage = "faisal.jpg"
        MosquesOA.append(m3)

        var f1 = Foods()
        f1.Food = "Samosa"
        f1.FDesc = "This fast food is like a fried pastry with a savory filling like vegetables, mixed spices, beef or other meats. It usually comes in a triangular shape. It is ate as a snack and is one of the popular variety of Pakistani street food."
        f1.FImage = "samosa.jpg"
        FoodsOA.append(f1)
        
        var f2 = Foods()
        f2.Food = "Biryani"
        f2.FDesc = "This main dish is made of mixed rice, spices, meat, and additional regional varieties. Each variety is named after its place such as Sindhi biryani or Hyderabadi biryani. This famous mouth-watering, royal course cooked with different flavors is a must-try."
        f2.FImage = "biryani.jpg"
        FoodsOA.append(f2)
        
        var f3 = Foods()
        f3.Food = "Kebab"
        f3.FDesc = "These are originally made from beef but can be found in other  forms of meat like chicken or lamb as well as styles/shapes. This fast food is usually grilled on a skewer and can be eaten with a naan, hot bun, or accompanied with Pakistani meals."
        f3.FImage = "kebab.jpg"
        FoodsOA.append(f3)

        var a1 = Attractions()
        a1.Attract = "SWAT"
        a1.ADesc = "It is located in Khyber Pakhtunkhwa, Pakistan. Due to its scenic beauty, landscapes, and weather tourists have called it paradise on earth and 'mini Switzerland' or as Queen Elizabeth II said 'Switzerland of the east (Asia)'. It has scenic countrysides, lush forests, and high peak mountains. It's filled with freshwater lakes, rivers, springs, waterfalls, and valleys. There are also many seasonal activities."
        a1.AImage = "swat.jpg"
        AttractionsOA.append(a1)
        
        var a2 = Attractions()
        a2.Attract = "Neelam Valley"
        a2.ADesc = "It is located in Azad Kashmir, also known as paradise on Earth. It extends  more than 200 kilometers to Muzaffarabad, with snowy mountain peaks and beautiful scenery all around. The breathtaking views  and natural beauty is hard to forget."
        a2.AImage = "neelam.jpg"
        AttractionsOA.append(a2)
        
        var a3 = Attractions()
        a3.Attract = "Minar-e-Pakistan"
        a3.ADesc = "It is a national monument located in Lahore, Pakistan. Known as the Tower of Pakistan, built to commemorate the Lahore Resolution, that established a separate homeland for the Muslims of British India passed in the annual session of the All India Muslim League. This tower symbolized Pakistan's independence."
        a3.AImage = "minar.jpg"
        AttractionsOA.append(a3)
    
        
        
     // motion funciton setter
        
        var r1 = Rand()
        r1.title = "Lahore"
        r1.descr = "Pakistan's second largest city and the capital of the north-eastern Punjab province. It is widely considered the country's cultural capital. The heart of Lahore is the Walled or Inner City, a very densely populated area. Founded in legendary times, and a cultural centre for over a thousand years, Lahore has many attractions for the tourist."
        r1.img = "lahore.jpeg"
        RandOA.append(r1)
        
        
        var r2 = Rand()
        r2.title = "Karachi"
        r2.descr = "The largest city, with a growth rate at a global stage, and a sprawling huge metropolis grown into the commercial, transport and political hub. Known as the 'City of the Quaid' because Pakistan's founder, Muhammad Ali Jinnah, was born and raised here and 'City of Lights' for its round clock liveliness. It offers a lot from sunny, sandy beaches and scurf-infested old colonial buildings, to traditional bazaars and modern shopping malls"
        r2.img = "karachi.jpeg"
        RandOA.append(r2)
        
        var r3 = Rand()
        r3.title = "Islamabad"
        r3.descr = "A modern planned, well-maintanied and organised city, Islamabad is Pakistan's clean, calm, and green capital since 1963, with its name deriving from two words, Islam and abaad, meaning 'City of Islam'.It hosts a large number of diplomats, politicians and government employees, making it one of the nation's most cosmopolitan, developed and urbanized cities. People come from all over to enjoy its peaceful, noise-free atmosphere with a lot of greenery and nice surrounding scenery."
        r3.img = "islamabad.jpg"
        RandOA.append(r3)
    
        var r4 = Rand()
        r4.title = "Badshahi Mosque"
        r4.descr = "This royal, Mughal era mosque is considered one of Lahore's most iconic landmark. It is the second largest mosque in Pakistan, located near the citadel Lahore Fort.  Created by Emperor Aurangzeb, it is the biggest and most beautiful mosque of that era, has an exterior that is decorated with carved red sandstone with marble inlay."
        r4.img = "badshahi.jpeg"
        RandOA.append(r4)
        
        var r5 = Rand()
        r5.title = "Masjid-e-Tooba"
        r5.descr = "Mosque with unique feature located in Karachi, Pakistan.  Also known as 'Gol(round) Masjid', it claims to be the largest single-dome mosque. It is entirely developed with white marble with a dome accompanied with low encircling wall no central pillars. A person talking on one side of the done can be listened at the other side. It is a beautiful and simple, yet classy mosque."
        r5.img = "tooba.jpg"
        RandOA.append(r5)
        
        var r6 = Rand()
        r6.title = "Faisal Masjid"
        r6.descr = "Located in Pakistan's capital city of Islamabad, it is the fifth-largest mosque in the world and the largest within South Asia. Inspired by Turkish architecture, its unique style consists of an eight-sided concrete shell shaped sloping roof, massive triangular prayer hall, and four minarets. The main tent-shaped hall’s interior is paved in white marble and embellished with mosaics and calligraphy."
        r6.img = "faisal.jpg"
        RandOA.append(r6)

        var r7 = Rand()
        r7.title = "Samosa"
        r7.descr = "This fast food is like a fried pastry with a savory filling like vegetables, mixed spices, beef or other meats. It usually comes in a triangular shape. It is ate as a snack and is one of the popular variety of Pakistani street food."
        r7.img = "samosa.jpg"
        RandOA.append(r7)
        
        var r8 = Rand()
        r8.title = "Biryani"
        r8.descr = "This main dish is made of mixed rice, spices, meat, and additional regional varieties. Each variety is named after its place such as Sindhi biryani or Hyderabadi biryani. This famous mouth-watering, royal course cooked with different flavors is a must-try."
        r8.img = "biryani.jpg"
        RandOA.append(r8)
        
        var r9 = Rand()
        r9.title = "Kebab"
        r9.descr = "These are originally made from beef but can be found in other  forms of meat like chicken or lamb as well as styles/shapes. This fast food is usually grilled on a skewer and can be eaten with a naan, hot bun, or accompanied with Pakistani meals."
        r9.img = "kebab.jpg"
        RandOA.append(r9)

        var r10 = Rand()
        r10.title = "SWAT"
        r10.descr = "It is located in Khyber Pakhtunkhwa, Pakistan. Due to its scenic beauty, landscapes, and weather tourists have called it paradise on earth and 'mini Switzerland' or as Queen Elizabeth II said 'Switzerland of the east (Asia)'. It has scenic countrysides, lush forests, and high peak mountains. It's filled with freshwater lakes, rivers, springs, waterfalls, and valleys. There are also many seasonal activities."
        r10.img = "swat.jpg"
        RandOA.append(r10)
        
        var r11 = Rand()
        r11.title = "Neelam Valley"
        r11.descr = "It is located in Azad Kashmir, also known as paradise on Earth. It extends  more than 200 kilometers to Muzaffarabad, with snowy mountain peaks and beautiful scenery all around. The breathtaking views  and natural beauty is hard to forget."
        r11.img = "neelam.jpg"
        RandOA.append(r11)
        
        var r12 = Rand()
        r12.title = "Minar-e-Pakistan"
        r12.descr = "It is a national monument located in Lahore, Pakistan. Known as the Tower of Pakistan, built to commemorate the Lahore Resolution, that established a separate homeland for the Muslims of British India passed in the annual session of the All India Muslim League. This tower symbolized Pakistan's independence."
        r12.img = "minar.jpg"
        RandOA.append(r12)
        
        RandOA.append(r1)
        RandOA.append(r2)
        RandOA.append(r3)
        RandOA.append(r4)
        RandOA.append(r5)
        RandOA.append(r6)
        RandOA.append(r7)
        RandOA.append(r8)
        RandOA.append(r9)
        RandOA.append(r10)
        RandOA.append(r11)
        RandOA.append(r12)
        
    }
    
}
