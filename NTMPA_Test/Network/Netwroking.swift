//
//  Netwroking.swift
//  NTMPA_Test
//
//  Created by Majd Deeb on 16/12/2020.
//  Copyright © 2020 Majd Deeb. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import MobileCoreServices

struct Networking {
    private static var apiKey: String {
        return "XW1PsAR1zNOJpU2DQIpCg1NGC8ajGX5E"
    }
    private static var serverUrl: String{
        return "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1.json?api-key=\(apiKey)" 
    }
    
    private static func getURL() -> URL{
        let urlString =  serverUrl
        return URL(string: urlString)!
    }
    
    
    
    public static func get(_ url: URL, _ completionHandler: @escaping (Data?)->()) {
        let urlString = url.absoluteString
        print(urlString)
        let finalUrl = URL(string: urlString)!
        Alamofire.request(finalUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { response in
            
            switch response.result{
            case .success( _):
                
                completionHandler(response.data)
            case .failure(let error):
                print(error)
                completionHandler(nil)
            }
        }
        
    }
    
    
    
    struct ApiRequests {
        static func  getMostPopularArticles(_ completionHandler : @escaping (GetMostPopularArticlesModel?)->()){
            let url : URL = getURL()
            get(url) { (json) in
                if json != nil
                {
                    //let jsonSS = try? JSON(data: json!)
                    // print(jsonSS)
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try? jsonDecoder.decode(GetMostPopularArticlesModel.self, from: json!)
                    completionHandler(responseModel)
                }
                else
                {
                    completionHandler(nil)
                }
            }
        }
        
        
    }
    
    
}
