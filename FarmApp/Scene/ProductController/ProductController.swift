//
//  ProductController.swift
//  FarmApp
//
//  Created by Alparslan Cafer on 08.03.24.
//

import UIKit

struct Item {
    let name: String?
    let titleDescription: String?
    let image: UIImage?
}


class ProductController: UIViewController {
    
    @IBOutlet private weak var productTableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Properties
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var modals  = [MyList]()
    private var coordinator: TitleCoordinator?
    private var item = [Item]()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAllItems()
        configureItem()
        configureCoordinator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllItems()
        
    }
    
    //MARK: - Functions
    
    private func configureItem() {
        navigationItem.title = "Product List"
        
    }
    
    private func configureCoordinator() {
        coordinator = TitleCoordinator(navigationController: navigationController ?? UINavigationController())
    }
    
    private func  getAllItems() {
        do {
            modals = try context.fetch(MyList.fetchRequest())
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
    
    //MARK: - Button
    
    @IBAction func addClicked(_ sender: Any) {
        coordinator?.addClickedController()
    }
}

    
    //MARK: - ProductController Extension
    


extension ProductController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
        cell.configureData(data: modals[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { _, _, _ in
            self.deleteItem(item: self.modals[indexPath.row])
            self.productTableView.reloadData()
        }
        
        delete.backgroundColor = .red
            return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           coordinator?.nextPageClicked(data: [modals[indexPath.row]])
       }
}



