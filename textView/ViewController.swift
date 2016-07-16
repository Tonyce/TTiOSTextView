//
//  ViewController.swift
//  textView
//
//  Created by D_ttang on 15/11/18.
//  Copyright © 2015年 D_ttang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var toolBarBottom: NSLayoutConstraint!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var textViewBottom: NSLayoutConstraint!
    @IBOutlet weak var textView: UITextView!
    var markDown = Markdown()
    var keyboardRect = CGRectZero
    var defaultContentInset = UIEdgeInsets()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        toolBarBottom.constant = 50
//            self.view.layoutIfNeeded()
//        let notificationCenter = NSNotificationCenter.defaultCenter()
//        notificationCenter.addObserver(self, selector: "handleKeyboardDidShow:", name: UIKeyboardWillShowNotification, object: nil)
//        notificationCenter.addObserver(self, selector: "handleKeyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
//        
//        let titleController = titleViewController()
//        print(titleController.view.frame)
//        titleController.view.frame.size.width = textView.frame.width
//        
//        titleController.view.frame.origin.y = -50
//        textView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
//        textView.textContainer.lineFragmentPadding = 100
//        textView.textContainer
//        textView.addSubview(titleController.view)
//        let top = NSLayoutConstraint(item: titleController.view,
//            attribute: NSLayoutAttribute.Top,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: textView,
//            attribute: NSLayoutAttribute.Top,
//            multiplier: 1,
//            constant: 10)
//        textView.addConstraint(top)
//        titleController.view.translatesAutoresizingMaskIntoConstraints = false        
//        let leading = NSLayoutConstraint(item: titleController.view,
//            attribute: NSLayoutAttribute.Leading,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: textView,
//            attribute: NSLayoutAttribute.Leading,
//            multiplier: 1,
//            constant: 10)
//        textView.addConstraint(leading)
//        let trailing = NSLayoutConstraint(item: titleController.view,
//            attribute: NSLayoutAttribute.Trailing,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: textView,
//            attribute: NSLayoutAttribute.Trailing,
//            multiplier: 1,
//            constant: 10)
//        textView.addConstraint(trailing)
//        let bottom = NSLayoutConstraint(item: titleController.view,
//            attribute: NSLayoutAttribute.Bottom,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: textView,
//            attribute: NSLayoutAttribute.Bottom,
//            multiplier: 1,
//            constant: 10)
//        textView.addConstraint(bottom)
        /*
        let titleView = UIView()
        print(textView.frame.width)
        titleView.frame = CGRect(x: 0, y: -100, width: textView.frame.width, height: 100)
        titleView.backgroundColor = UIColor.redColor()
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("btn", forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.blackColor()
        titleView.addSubview(btn)
        textView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        textView.addSubview(titleView)
        let top = NSLayoutConstraint(item: btn,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: titleView,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 10)
        titleView.addConstraint(top)
        */
//        let leading = NSLayoutConstraint(item: btn,
//            attribute: NSLayoutAttribute.Leading,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: titleView,
//            attribute: NSLayoutAttribute.Leading,
//            multiplier: 1,
//            constant: 0)
//        titleView.addConstraint(leading)
//        let trailing = NSLayoutConstraint(item: btn,
//            attribute: NSLayoutAttribute.Trailing,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: titleView,
//            attribute: NSLayoutAttribute.Trailing,
//            multiplier: 1,
//            constant: 0)
//        titleView.addConstraint(trailing)
//        btn.frame.size.height = 60
//        let height = NSLayoutConstraint(item: titleView,
//            attribute: NSLayoutAttribute.Height,
//            relatedBy: NSLayoutRelation.Equal,
//            toItem: nil,
//            attribute: NSLayoutAttribute.Height,
//            multiplier: 1,
//            constant: 60)
//        titleView.addConstraint(height)
//        let markStr = "###h3 \n *iiii*"
//        let htmlStr = markDown.transform(markStr)
//        textView

//        let expected = "<p>This is <strong>bold</strong>. This is also <strong>bold</strong>.</p>\n"
//        let input = "#h3   \r\nThis is **bold**. This is also __bold__.    \n - fdksfa   \r\n * fjsaklfja;"
//        let actual = markDown.transform(input)
        

//        var markedJS = ""
//        let path = NSBundle.mainBundle().pathForResource("preview", ofType: "html")
//        do {
//            markedJS = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
//        }catch _ {}

        let configuration = WKWebViewConfiguration()
        let testScriptURL = NSBundle.mainBundle().pathForResource("marked.min", ofType: "js")
        let testJS: String?
        do {
            testJS = try String(contentsOfFile:testScriptURL!, encoding:NSUTF8StringEncoding)
        } catch _ {
            testJS = nil
        }
        let testScript = WKUserScript(source: testJS!, injectionTime: .AtDocumentStart, forMainFrameOnly: true)
        configuration.userContentController.addUserScript(testScript)
//        wkWebView.configuration = configuration
//        let wkWebView = WKWebView(frame: CGRectZero, configuration: configuration)
        //        configuration.userContentController.addScriptMessageHandler(self, name: "myApp")
        
        let wkWebView = WKWebView(frame: CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height - 40) , configuration: configuration)
        
        wkWebView.evaluateJavaScript("marked('# Marked in browser\n\nRendered by **marked**.')") {
            (obj, err) -> Void in
            print(obj)
            print(err)
        }
        
        
//        wkWebView.evaluateJavaScript("(function a() {return 'aa'})()") {
//            (obj, err) -> Void in
//            print(obj)
//        }
        

//        print(actual)
//
//        
//        let options = [
//            NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
//            NSFontAttributeName: UIFont.systemFontOfSize(20.0)
//        ]
//        
//        var preview: NSAttributedString?
//        do {
//            preview = try NSAttributedString(data: actual.dataUsingEncoding(NSUTF8StringEncoding)!, options: options, documentAttributes: nil)
//        }catch _ {
//            
//        }
//        textView.attributedText = preview
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func handleKeyboardWillShowNotification(notification: NSNotification) {
        
    }
    
    func handleKeyboardWillHideNotification(notification: NSNotification) {

    }
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

extension ViewController {
    func handleKeyboardDidShow (notification: NSNotification){
        
        /* Get the frame of the keyboard */
        let keyboardRectAsObject = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        
        /* Place it in a CGRect */
        
        
        keyboardRectAsObject.getValue(&keyboardRect)
        // print(keyboardRect.size.height)
        

        self.textViewBottom.constant = 44 + self.keyboardRect.size.height
        self.toolBarBottom.constant = -(self.keyboardRect.size.height)
        UIView.animateWithDuration(0.4) { () -> Void in
            self.view.layoutIfNeeded()
        }
        
        
        
    }
    
    func handleKeyboardWillHide(notification: NSNotification){
        
        keyboardRect = CGRectZero
        textViewBottom.constant = 0
        toolBarBottom.constant = 50
//        textView.contentInset = defaultContentInset
    }
    
    @IBAction func dismissKB(sender: AnyObject) {
        textView.resignFirstResponder()
    }
}

