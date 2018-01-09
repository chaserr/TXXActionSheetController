//
//  ExampleTableViewController.swift
//  TXXActionSheetController
//
//  Created by 童星 on 2018/1/9.
//  Copyright © 2018年 cn.tongxing. All rights reserved.
//

import UIKit
class ExampleTableViewController: UITableViewController {
    
    //    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func customHeader(theme: TXXActionSheetTheme) {
        let thankAction = TXXAction(icon: UIImage(named: "Comment"), title: "Thanks for the heads up!", handler: { [unowned self] (accessoryView) in
            self.doSomething()
        })
        
        let grewUpAction = TXXAction(icon: UIImage(named: "Comment"), title: "The child is grown, the dream is gone...", handler: { [unowned self] (accessoryView) in
            self.doSomething()
        })
        
        let actionSheetController = TXXActionSheetController(
            title: "美女",
            message: "这是谁？",
            actionSections: [thankAction, grewUpAction])
        
        actionSheetController.theme = theme
        
        let imageView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: UIScreen.main.bounds.width, height: 150)))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "1-740")
        actionSheetController.customHeaderView = imageView
        
        actionSheetController.willDismiss = { [unowned self] in
            print("I will dismiss.")
            self.doSomething()
        }
        
        actionSheetController.didDismiss = { [unowned self] in
            print("I did dismiss.")
            self.doSomething()
        }
        
        present(actionSheetController, animated: true, completion: nil)
    }
    
    
    fileprivate func noHeader(theme: TXXActionSheetTheme) {
        let infoAction = TXXAction(icon: UIImage(named: "Info"), title: "Library information", handler: { [unowned self] (accessoryView) in
            self.doSomething()
        })
        
        
        let commentAction = TXXAction(icon: UIImage(named: "Comment"), title: "Add comment", handler: { [unowned self] (accessoryView) in
            self.doSomething()
        })
        
        let lightBulbAction = TXXAction(
            icon: UIImage(named: "Light"),
            title: "Edison light bulb will show you how to add and handle UISwitch",
            handler: { [unowned self] (accessoryView) in
                self.doSomething()
            },
            accessoryView: UISwitch(),
            dismissOnAccessoryTouch: false) { [unowned self] (accessoryView) in
                if let lightBulbSwitch = accessoryView as? UISwitch {
                    if lightBulbSwitch.isOn {
                        print("Light is ON!\n")
                    } else {
                        print("Light is OFF!\n")
                    }
                }
                self.doSomething()
        }
        
        let actionSheetController = TXXActionSheetController(title: "title", message: "message", actionSections: [infoAction, commentAction], [lightBulbAction])
        actionSheetController.theme = theme
        
        actionSheetController.willDismiss = { [unowned self] in
            print("I will dismiss.")
            self.doSomething()
        }
        
        actionSheetController.didDismiss = { [unowned self] in
            print("I did dismiss.")
            self.doSomething()
        }
        
        present(actionSheetController, animated: true, completion: nil)
    }
    
    fileprivate func doSomething() {
        // Dummy function
        print("I've done something.\n")
    }
}

extension ExampleTableViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch ((indexPath as NSIndexPath).section, (indexPath as NSIndexPath).row) {
        case (0, 0):
            customHeader(theme: .light())
        case (0, 1):
            noHeader(theme: .light())
        default:
            return
        }
    }

}

