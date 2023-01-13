import UIKit

let separated = ","
var greeting = ",  ;;,test test;test1t test ttt,test;;;;"

func replaceString(_ string: String) -> String {
    var string = string.replacingOccurrences(of: ";", with: separated)
    string = string.replacingOccurrences(of: " ", with: separated)
    
    return string
}

func getAttrString(_ string: String) -> NSAttributedString {
    print(string)
    var string = string
    
    var replaceString = replaceString(string)
    print(replaceString)
    var strArr = replaceString.split(separator: separated)
    print(strArr)
    
    var returnAttrString = NSMutableAttributedString()
    
    for str in strArr {
        if let range = string.range(of: str) {
            let first = string[string.startIndex..<range.lowerBound]
            returnAttrString.append(NSAttributedString(string: String(first)))
            print("first : \(first)")
            if str == "test" {
                var attributes = [
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17),
                ]
                
                returnAttrString.append(NSAttributedString(string: String(str), attributes: attributes))
            } else {
                var attributes = [
                    NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17),
                ]
                
                returnAttrString.append(NSAttributedString(string: String(str), attributes: attributes))
            }
            
            string.removeSubrange(string.startIndex..<range.upperBound)
        }
    }
    
    returnAttrString.append(NSAttributedString(string: string))
    
    return returnAttrString
}

func checkAttrString(_ origin: String, attrString: NSAttributedString) {
    print("\n\n")
    print("======================")
    print(origin)
    print(attrString.string)
    
    if origin == attrString.string {
        print("========성공========")
    } else {
        print("========실패========")
    }
}

checkAttrString(greeting, attrString: getAttrString(greeting))
