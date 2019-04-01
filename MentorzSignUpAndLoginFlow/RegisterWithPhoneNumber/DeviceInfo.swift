//
//    DeviceInfo.swift

import Foundation
import ObjectMapper


class DeviceInfo: NSObject, Mappable{
    
    var deviceToken : String?
    var deviceType : String?
    
    override public init() {
        super.init()
    }
    
    required  init?(map: Map) {
        
    }
    convenience init(deviceToken:String,deviceType:String) {
        self.init()
        self.deviceToken = deviceToken
        self.deviceType = deviceType
    }
    func mapping(map: Map)
    {
    
        deviceToken <- map["device_token"]
        deviceType <- map["device_type"]
        
    }
}
   
    

