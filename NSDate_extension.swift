//
//  NSDate_extension.swift
//  MyChatSwift
//
//  Created by 郝龙 on 2018/8/1.
//  Copyright © 2018年 com.co-cloud.safeChat. All rights reserved.
//

import Foundation

extension Date {
	
	func lastMessageDisplayDate() -> String {
		if isToday() {
			return displayWithFormateString(formate: "HH:mm")
		}else if isYesterday(){
			return displayWithFormateString(formate: "昨天")
		}else if isThisWeek() {
			return displayWithFormateString(formate: "EEEE")
		}else {
			return displayWithFormateString(formate: "yyyy年M月d日")
		}
	}
	
	func messageDisplayDate() -> String {
		if isToday() {
			return displayWithFormateString(formate: " HH:mm")
		}else if isYesterday() {
			return displayWithFormateString(formate: "昨天 HH:mm")
		}else if isThisWeek(){
			return displayWithFormateString(formate: "EEEE: HH:mm")
		}else {
			return displayWithFormateString(formate: "yyyy年M月d日 HH:mm")
		}
	}
	
	func isToday() -> Bool {
		var todayDate: Date = Date.init()
		let formate: DateFormatter = DateFormatter.init()
		formate.dateFormat = "yyyy-MM-dd";
		let dateStr = formate.string(from: Date.init())
		todayDate = formate.date(from: dateStr)!
		return self.timeIntervalSince(todayDate) > 0
	}
	func isYesterday() -> Bool {
		let yestodayDate: Date = Date.init(timeInterval: -24 * 3600, since: self)
		return self.timeIntervalSince(yestodayDate) > 0
	}
	
	func isThisWeek() -> Bool {
		let oneWeekAgoDate: Date = Date.init(timeInterval: -24 * 3600 * 7, since: self)
		return self.timeIntervalSince(oneWeekAgoDate) > 0
	}
	func displayWithFormateString(formate: String) -> String {
		guard formate.count > 0 else { return "" }
		let dateFormatter: DateFormatter = DateFormatter.init()
		dateFormatter.dateFormat = formate
		return dateFormatter.string(from: self)
	}
}
