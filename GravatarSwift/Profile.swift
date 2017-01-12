//
//  Profile.swift
//  GravatarSwift
//
//  Created by Hakan on 1/12/17.
//  Copyright © 2017 Hakan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Profile: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    var imageUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        let md5Data = MD5(string:imageUrl)
        let md5Hex =  md5Data!.map { String(format: "%02hhx", $0) }.joined()
        Alamofire.request("https://www.gravatar.com/avatar/\(md5Hex)?s=600").responseImage { response in
            if let image = response.result.value {
               self.profileImage.image = image
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func MD5(string: String) -> Data? {
        guard let messageData = string.data(using:String.Encoding.utf8) else { return nil }
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        return digestData
    }


}
