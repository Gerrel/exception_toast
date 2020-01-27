//
//  UIView+Toast.swift
//  exception_toast
//
//  Created by Gerrel on 27/01/2020.
//

import Foundation
import UIKit

extension UIView {
    
    static let CORNER_RADIUS: CGFloat = 8.0
    static let BACKGROUND_COLOR = UIColor.black.withAlphaComponent(0.85)
    static let FONT = UIFont.systemFont(ofSize: 16)
    static let TEXT_COLOR = UIColor.white
    static let MAX_WIDTH_PERCENTAGE: CGFloat = 0.8
    static let MAX_HEIGHT_PERCENTAGE: CGFloat = 0.8
    static let H_PADDING: CGFloat = 10.0
    static let V_PADDING: CGFloat = 20.0
    static let FADE_ANIM_INTERVAL = TimeInterval(floatLiteral: 0.25)
    static let VISIBILITY_INTERVAL = DispatchTimeInterval.seconds(5)
    
    func showToast(text: String) {
        
        let toast = createToastView(text: text)
        self.showToastView(toast: toast)
    }
    
    private func showToastView(toast: UIView) {
        toast.alpha = 0.0
        toast.center =  CGPoint(x: self.bounds.size.width/2, y: (self.bounds.size.height - (toast.frame.size.height / 2)) - UIView.V_PADDING);
        
        self.addSubview(toast)
        UIView.animate(
            withDuration: UIView.FADE_ANIM_INTERVAL, delay: 0.0, options: .curveEaseOut,
            animations: {
                toast.alpha = 1.0
        }) { (completed) in
            DispatchQueue.main.asyncAfter(deadline: .now() + UIView.VISIBILITY_INTERVAL) { [weak self] in
                self?.removeToastView(toast: toast)
            }
        }
        
    }
    
    private func removeToastView(toast: UIView) {
        
        UIView.animate(withDuration: UIView.FADE_ANIM_INTERVAL, delay: 0.0, options: .curveEaseIn, animations: {
            toast.alpha = 0.0
        }) { (completed) in
            toast.removeFromSuperview()
        }
        
    }
    
    private func createToastView(text: String) -> UIView {
        
        // construct
        let container = UIView()
        container.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        container.layer.cornerRadius = UIView.CORNER_RADIUS
        container.backgroundColor = UIView.BACKGROUND_COLOR
        
        let textLabel = UILabel()
        textLabel.numberOfLines = 0
        textLabel.font = UIView.FONT
        textLabel.textAlignment = .left
        textLabel.lineBreakMode = .byTruncatingTail
        textLabel.textColor = UIView.TEXT_COLOR
        textLabel.backgroundColor = UIColor.clear
        textLabel.alpha = 1.0
        textLabel.text = text
        
        // calc label frame
        let maxSize = CGSize(width: (self.bounds.size.width * UIView.MAX_WIDTH_PERCENTAGE), height: (self.bounds.size.height * UIView.MAX_HEIGHT_PERCENTAGE))
        let expectedSize = textLabel.sizeThatFits(maxSize)
        let actualSize = CGSize(width: min(maxSize.width, expectedSize.width), height: min(maxSize.height, expectedSize.height))
        textLabel.frame = CGRect(x: UIView.H_PADDING, y: UIView.V_PADDING, width: actualSize.width, height: actualSize.height)
        
        // calc container frame
        let containerWidth = actualSize.width + (UIView.H_PADDING * 2)
        let containerHeight = actualSize.height + (UIView.V_PADDING * 2)
        
        // assemble
        container.addSubview(textLabel)
        container.frame = CGRect(x: 0.0, y: 0.0, width: containerWidth, height: containerHeight)
        return container
    }
}
