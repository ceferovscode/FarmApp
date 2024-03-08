//
//  ProductController.swift
//  FarmApp
//
//  Created by Alparslan Cafer on 08.03.24.
//

import UIKit

class ProductController: UIViewController {

    @IBOutlet private weak var productTableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var modals = [Mylist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func  getAllItems() {
        do {
            modals = try context.fetch(Mylist.fetchRequest())
            DispatchQueue.main.async {
                self.productTableView.reloadData()
            }
        } catch {
            
        }
    }
    
    private func  createitem(name: String) {
        let newItem = Mylist(context: context)
        newItem.productName = name
        newItem.date = Date()
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    private func  deleteItem(item: Mylist) {
        context.delete(item)
        
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    private func  updateItem(item: Mylist, newName: String) {
        item.productName =  newName
        
        do {
            try context.save()
        } catch {
            
        }
    }
    

    @IBAction func addClicked(_ sender: Any) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AddController") as! AddController
        navigationController?.show(controller, sender: nil)
    }
    

    
    
    
    
}

extension ProductController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modals = modals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
        cell.textLabel?.text = modals.productName
        return cell
    }
    
    
}




