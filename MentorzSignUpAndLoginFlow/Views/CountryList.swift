//
//  CountryList.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit
class Country {
    var countryCode : String?
    var iso : String?
    var countryName : String?
    init (countryCode:String,iso:String,countryName:String){
        self.countryCode = countryCode
        self.iso = iso
        self.countryName = countryName
    }
}
protocol countryCodeDelegate{
    func getcountryCode(code: Country)
}
class CountryList: UIViewController,XMLParserDelegate,UITableViewDelegate,UITableViewDataSource {
    var countries = [Country]()
    var elementName: String = String()
    var countryCode = String()
    var iso = String()
    var countryName = String()
    var delegateCode : countryCodeDelegate?
    
    @IBOutlet weak var countrylist: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CountryCell
        cell.countryCode?.text = "+"+countries[indexPath.row].countryCode!
        cell.countryName?.text = countries[indexPath.row].countryName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegateCode?.getcountryCode(code: countries[indexPath.row])
        self.dismiss(animated: true, completion: nil)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.url(forResource: "countries", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
                countrylist.register(UINib(nibName: "CountryCell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
                countrylist.delegate = self
                countrylist.dataSource = self
            }
        }
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "country" {
            countryName = attributeDict["name"] ?? "xxx"
            iso = attributeDict["code"] ?? "xxx"
            countryCode = attributeDict["phoneCode"] ?? "xxx"
        }
        
        self.elementName = elementName
    }
    
    // 2
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "country" {
            let country = Country(countryCode: countryCode, iso: iso, countryName: countryName)
            countries.append(country)
        }
    }
    
    // 3
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if self.elementName == "countryCode" {
                countryCode += data
            } else if self.elementName == "iso" {
                iso += data
            }else if self.elementName == "countryName" {
                countryName += data
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
