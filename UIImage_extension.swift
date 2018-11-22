//
//  UIImage_extension.swift
//  MyChatSwift
//
//  Created by 郝龙 on 2018/7/23.
//  Copyright © 2018年 com.co-cloud.safeChat. All rights reserved.
//

import Foundation
import UIKit
import CoreImage
typealias NCIImage = CIImage

extension UIImage {
	
	static func imageWithColor(color: UIColor,alpha: CGFloat) -> UIImage {
		let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
		UIGraphicsBeginImageContext(rect.size);
		let context = UIGraphicsGetCurrentContext();
		context!.setFillColor(color.cgColor);
		context!.setAlpha(alpha);
		context!.fill(rect);
		let image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		return image!;
	}
	
	func blurImageWithLevel(level: CGFloat) -> UIImage {
		//处理原始NSData数据
		guard let inputImg = NCIImage.init(image: self) else {
			return self
		}
		//创建高斯模糊滤镜
		guard let filter = CIFilter(name: "CIGaussianBlur") else {
			return self
		}
		filter.setValue(inputImg, forKey: kCIInputImageKey)
		filter.setValue(level, forKey: "inputRadius")
		guard let outputImg = filter.outputImage else {
			return self
		}
		//生成模糊图片
		let context = CIContext(options: nil)
		let theCgImg = context.createCGImage(outputImg, from: inputImg.extent)
		return UIImage.init(cgImage: theCgImg!)
	}}
