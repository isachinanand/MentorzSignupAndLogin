//
//  CountryList.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

protocol CountryCodeDelegate {
    func didSelectCountryCode(country:Country)
}
class CountryCodeVC: UIViewController {
    //MARK: outlets
    @IBOutlet weak var countryTable: UITableView!
    var delegate:CountryCodeDelegate?
    var selectedCountryCode:String?
    
    fileprivate var tableManagementArray = Array<Country>()
    fileprivate var filteredTableManagementArray = Array<Country>()
    fileprivate var isFiltered:Bool = false
    fileprivate var country:Country?
    fileprivate var searchBar = UISearchBar()
    fileprivate let searchBarHeight:CGFloat = 50.0
    fileprivate let tableCellHeight : CGFloat = 44.0
    
    
    //MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpView()
        self.beginXMLParsingForCountriesCode()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: setUpView
    func setUpView(){
      //  self.searchBar.barTintColor = UIColor.app_blue_Color
        setUpTableView()
     //   setUpNavigationBar(title:"CHOOSE A COUNTRY".localized)
    }
    
    func setUpTableView() {
        countryTable.delegate = self
        countryTable.dataSource = self
        countryTable.separatorStyle = .none
    }
    
    func beginXMLParsingForCountriesCode(){
        
        guard let path = Bundle.main.url(forResource: XML.countries, withExtension: XML.fileExtension) else{
            return
        }
        
        if let parser = XMLParser(contentsOf: path) {
            parser.delegate = self
            parser.parse()
            
            self.countryTable.reloadData()
        }
        
        
    }
    
    
    func setUpNavigationBar(title:String) {
        self.title = title;
       // self.navigationController?.navigationBar.backgroundColor = UIColor.app_blue_Color
        self.navigationController?.navigationBar.isTranslucent = false
        let image = UIImage(imageLiteralResourceName: "back_icon")
        let leftButton: UIBarButtonItem = UIBarButtonItem(image:image, style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButtonClicked))
        navigationItem.leftBarButtonItem = leftButton
        
    }
    
    
    
    //MARK: CickAction
    @objc func backButtonClicked() {
        
        self.dismiss(animated: true, completion: nil);
    }
    
    
    //MARK: Custom method
    
    func isPreviouslySelectedCountryCode(code:String) -> Bool{
        
        return code == selectedCountryCode
    }
    
    
}



//MARK: UITableViewDelegate
extension CountryCodeVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
        
        let countryCellData:Country = isFiltered ? filteredTableManagementArray[indexPath.row] :tableManagementArray[indexPath.row]
        
        self.delegate?.didSelectCountryCode(country: countryCellData)
        self.dismiss(animated: true, completion: nil);
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableCellHeight;
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        searchBar.frame = CGRect.init(x:0, y: 0, width: countryTable.frame.size.width, height: searchBarHeight)
        searchBar.delegate = self;
        searchBar.enablesReturnKeyAutomatically = false;
        searchBar.returnKeyType = .done
        
        return searchBar;
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return searchBarHeight;
    }
    
    
    
}


//MARK: UITableViewDataSource
extension CountryCodeVC:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isFiltered ? filteredTableManagementArray.count : tableManagementArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let countryCellData:Country = isFiltered ? filteredTableManagementArray[indexPath.row] : tableManagementArray[indexPath.row];
        
        
        let cell = countryTable.dequeueReusableCell(withIdentifier: "CountryCodeCell", for: indexPath) as! CountryCodeTVC
        
        cell.setData(countryCellData)
        
        return cell;
    }
    
}


//MARK: UISearchBarDelegate
extension CountryCodeVC:UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count == 0{
            isFiltered = false
        }
            
        else{
            isFiltered = true
            filteredTableManagementArray.removeAll()
            
            
            let filter =  tableManagementArray.filter{
                let nameRange =  ($0.name!.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil));
                let codeRange = $0.code!.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil);
                return nameRange != nil || codeRange != nil
                
            }
            filteredTableManagementArray.append(contentsOf: filter)
        }
        
        
        self.countryTable.reloadData();
    }
    
    
    
}


//MARK: XMLParserDelegate
extension CountryCodeVC:XMLParserDelegate{
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        if elementName == XML.Tag.country{
            
            let phoneCode:String? = "+\(attributeDict[XML.Tag.Attribute.phoneCode]!)"
            country = Country(name: attributeDict[XML.Tag.Attribute.name]!, code:phoneCode!)
            
            if isPreviouslySelectedCountryCode(code: phoneCode!) {
                country?.isSelected = true;
            }
            
        }
        
    }
    
    
    func parser(_ parser: XMLParser, foundCharacters string: String){
        
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        
        if elementName == XML.Tag.country{
            
            self.tableManagementArray.append(country!)
            country = nil
        }
    }
    
}
