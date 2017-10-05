//
//  SwitchingViewController.swift
//  MAPD-F2017-MultiviewApp
//
//  Created by Sergio de Almeida Brunacci on 2017-10-04.
//  Copyright © 2017 Sergio de Almeida Brunacci. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    //PRIVATE INSTANCE VARIABLES
    
    private var _blueViewController:BlueViewController!
    private var _yellowViewController:YellowViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view
        
        self._blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
        
        self._blueViewController.view.frame = view.frame
        switchViewController(from: nil, to: self._blueViewController)
        
    }
    
    @IBAction func switchViews(sender: UIBarButtonItem){
        //instantiate the new view controller object
        if self._yellowViewController?.view.superview == nil{
            if self._yellowViewController == nil{
                self._yellowViewController = storyboard?.instantiateViewController(withIdentifier: "Yellow") as! YellowViewController
            }
        }else if self._blueViewController?.view.superview == nil{
            if self._blueViewController == nil{
                self._blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
            }
        }
        // clean up current controller and attach the new one
        if self._blueViewController != nil && self._blueViewController!.view.superview != nil{
            self._yellowViewController.view.frame = view.frame
            switchViewController(from: self._blueViewController, to: self._yellowViewController)
            
            
        }else{
            _blueViewController.view.frame = view.frame
            switchViewController(from: _yellowViewController, to: _blueViewController)
            
        }
        
        func didReceiveMemoryWarning(){
            super.didReceiveMemoryWarning()
            
            if self._blueViewController != nil && self._blueViewController!.view.superview == nil{
                self._blueViewController = nil
            }
            
            if self._yellowViewController != nil && self._yellowViewController!.view.superview == nil{
                self._yellowViewController = nil
            }
            
        }
        
    }
    
    private func switchViewController(from fromVC: UIViewController?, to toVC: UIViewController?){
        if fromVC != nil{
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        
        if toVC != nil {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            self.didMove(toParentViewController: self)
        }
        
    }
}
