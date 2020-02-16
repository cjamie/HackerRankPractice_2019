import Foundation
import CommonCrypto

func sha256(data : Data) -> Data {
    var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
    data.withUnsafeBytes {
        _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
    }
    return Data(hash)
}


let myString = "my cusyom dytin ghet"

if let myStringAsData = myString.data(using: .utf8) {
    let result = sha256(data: myStringAsData)
    
    
    print(result)
    print(String(data: result, encoding: .utf8))
    dump(result)

}

