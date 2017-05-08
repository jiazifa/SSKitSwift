//
//  SSDictionary.swift
//  SSKitSwiftCDemo
//
//  Created by Mac on 16/9/19.
//  Copyright © 2016年 YD. All rights reserved.
//

import Foundation

public extension NSDictionary {
    
    /// 是否包含了
    ///
    /// - Parameter key: 键值
    /// - Returns: 是否包含了该键值
    public func containsObject(_ key:String) -> Bool {
        if key.isEmpty {return false}
        return self[key] != nil
    }
    
    public func entries(forKeys:[String]) -> NSDictionary {
        let dic : NSMutableDictionary = NSMutableDictionary.init(capacity: 0)
        for key in forKeys {
            if self.object(forKey: key) != nil {dic[key] = self.object(forKey: key)}
        }
        return dic.copy() as! NSDictionary
    }
    
    /// 将一个字典对象转换成json字符串对象
    ///
    /// - Returns: 返回的json字符串的对象
    @discardableResult
    public func jsonStringEncode() -> String? {
        if JSONSerialization.isValidJSONObject(self) == false {return nil}
        let jsonData : NSData
        do {
            jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions(rawValue: UInt(0))) as NSData
            let json = String.init(data: jsonData as Data, encoding: String.Encoding.utf8)
            return json ?? ""
        } catch  {
            return nil
        }
    }
    
    
    
}
