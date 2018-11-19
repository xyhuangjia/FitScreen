
import Foundation
import DeviceKit

public class FitScreenKit: NSObject {
//    struct CalloutSize {
//        Callout750X1334  = 1 << 0,
//        Callout1080X1920 = 1 << 1,
//    }
    let  device = Device()
    static var parameterOne:CGFloat = 0.96
    static var parametertwo:CGFloat = 1.171875
    static var parameterThree:CGFloat = 1.15
}
extension FitScreenKit{

    public func FactorX(value:CGFloat) -> Double {
        var  normalFactor:Double;
        switch device {
            
        case .simulator(.iPhoneXsMax), .iPhoneXsMax:
          
             print("XMax")
        case .simulator(.iPhoneXr), .iPhoneXr:
          
             print("XR")
            
        case .simulator(.iPhoneXs),.simulator(.iPhoneX), .iPhoneXs, .iPhoneX:
             print("X")
    case .simulator(.iPhone6Plus), .simulator(.iPhone6sPlus), .simulator(.iPhone7Plus), .simulator(.iPhone8Plus), .iPhone6Plus, .iPhone6sPlus, .iPhone7Plus, .iPhone8Plus:
             print("Plus")
             normalFactor = Double(FitScreenKit.parameterThree/3.0)
    case .simulator(.iPhone6), .simulator(.iPhone6s), .simulator(.iPhone7), .simulator(.iPhone8), .iPhone6, .iPhone6s, .iPhone7, .iPhone8:
             print("正常设备")
             normalFactor  =  Double(1/FitScreenKit.parameterOne/3.0);
            
        case .simulator(.iPhone5), .simulator(.iPhone5s), .simulator(.iPhone5c), .iPhone5, .iPhone5s, .iPhone5c:
            print("5")
            normalFactor =  Double(1/FitScreenKit.parameterOne/3.0/FitScreenKit.parametertwo);
        
        default:
            print("未知设备")
        }
        
        return 24.0
    }
    public func FactorY(value:CGFloat) -> Double {
      
        return 24.0
    }
}
