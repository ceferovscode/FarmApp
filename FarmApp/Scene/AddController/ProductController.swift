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
    
    private var modals = [MyList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllItems()

    }
    
    private func  getAllItems() {
        do {
            modals = try context.fetch(MyList.fetchRequest())
//            print(modals.first?.productName ?? "")
            DispatchQueue.main.async {
                self.productTableView.reloadData()
            }
        } catch {
            
        }
    }
    
    private func  createitem(name: String) {
        let newItem = MyList(context: context)
        newItem.productName = name
        
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
    }
    
    private func  deleteItem(item: MyList) {
        context.delete(item)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
        cell.configureData(data: modals[indexPath.row])
        return cell
    }
    
    
    
    
}




