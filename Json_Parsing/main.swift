//
//  main.swift
//  Json_Parsing
//
//  Created by Karan Kumar on 2019-10-17.
//

import Foundation

func readJsonFile(jsonFileName: String)
{
    let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")
    
    guard let jsonData = url else{
        return
    }
    
    guard let data = try? Data(contentsOf: jsonData) else {
        return
    }
    
    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
        return
    }
    
    //print(json)
    
    var user = User()
    if let jsonDictionay = json as? [String: Any]
    {
        if let email = jsonDictionay["email"] as? String
        {
            print(email)
            user.email = email
        }
        
        if let username = jsonDictionay["username"] as? String
        {
            print(username)
            user.username = username
        }
        
        //Read Address dictionary
        var address: Address
        if let addressDict = jsonDictionay["address"] as? Dictionary<String, Any>
        {
            address = Address()
            if let city = addressDict["city"] as? String
            {
                print(city)
                address.city = city
            }
            
            //read geo dictionary here
            var geo: Geo
            if let geoDict = addressDict["geo"] as? [String:Any]
            {
                geo = Geo()
                if let lat = geoDict["lat"] as? String
                {
                    print(lat)
                    geo.lat = lat
                }
                
                if let lng = geoDict["lng"] as? String
                {
                    print(lng)
                    geo.lng = lng
                }
                
                address.geo = geo
            }
            
            user.address = address
        }
        
        //Read Company Dictionary
    }
}

readJsonFile(jsonFileName: "Users")

//  This is Important For Project **************************************************
func readJsonFileArray(jsonFileName: String)
{
    let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")
    
    guard let jsonData = url else{
        return
    }
    
    guard let data = try? Data(contentsOf: jsonData) else {
        return
    }
    
    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
        return
    }
print("\n\n\n\n\nUserList JSON File Reading\n\n\n\n\n")
    //print(json)
    
    var userList = [String: User]()
    if let jsonArray = json as? [Any]
    {
        var user: User!
        for userObject in jsonArray
        {
            user = User()
            if let jsonDictionay =  userObject as? [String: Any]
            {
                if let email = jsonDictionay["email"] as? String
                {
                    print(email)
                    user.email = email
                }
        
                if let username = jsonDictionay["username"] as? String
                {
                    print(username)
                    user.username = username
                }
        
            //Read Address dictionary
            var address: Address
            if let addressDict = jsonDictionay["address"] as? Dictionary<String, Any>
            {
                address = Address()
                if let city = addressDict["city"] as? String
                {
                    print(city)
                    address.city = city
                }
                
                //read geo dictionary here
                var geo: Geo
                if let geoDict = addressDict["geo"] as? [String:Any]
                {
                    geo = Geo()
                    if let lat = geoDict["lat"] as? String
                    {
                        print(lat)
                        geo.lat = lat
                    }
                    
                    if let lng = geoDict["lng"] as? String
                    {
                        print(lng)
                        geo.lng = lng
                    }
                    
                    address.geo = geo
                }
                
                user.address = address
            }
        
                //Read Company Dictionary
            }
            userList[user.username!] = user
            print("\n\n\n")
        }
    }
    
 //   print("\n\n\n\n",userList,"\n\n\n")
    
    print(userList.count)
}

readJsonFileArray(jsonFileName: "UserList")
// Upto here it is important for the project*********************************************

//Reading Text File
func readTextFile(fileName: String)
{
    if let pathOfText = Bundle.main.path(forResource: "Sample", ofType: "txt")
    {
        do{
            let text = try String(contentsOfFile: pathOfText)
            print(text)
        }
        catch
        {
            print("Error while reading text file")
        }
    }else{
         print("No Such file exist to read text")
    }
}

readTextFile(fileName: "Sample")
