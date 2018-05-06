//
//  DIHelper.swift
//  DribbbleInvision
//
//  Created by pingguo on 2018/5/6.
//  Copyright © 2018年 hl. All rights reserved.
//

import UIKit

class DIHelper: NSObject {
    class func getLinearRatio(max:CGFloat, min:CGFloat, mid:CGFloat) -> CGFloat{
        return (mid - min) / (max - min);
    }
    class func getEaseInMid(max:CGFloat, min:CGFloat, ratio:CGFloat) -> CGFloat {
        let rat = funcEaseIn(x: ratio)
        return (max - min) * rat + min;
    }
    class func getEaseOutMid(max:CGFloat, min:CGFloat, ratio:CGFloat) -> CGFloat {
        let rat = funEaseOut(x: ratio)
        return (max - min) * rat + min;
    }
    class func funcEaseIn(x:CGFloat) -> CGFloat {
        return pow(x, 2)
    }
    class func funEaseOut(x:CGFloat) -> CGFloat {
        return pow(x, 0.5)
    }
    
}
