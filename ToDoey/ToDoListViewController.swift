//
//  ViewController.swift
//  ToDoey
//
//  Created by Ryan Cornel on 9/4/18.
//  Copyright © 2018 Ryan Cornel. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController{
	
	@IBOutlet weak var addButtonOutlet: UIBarButtonItem!
	
	let defaults = UserDefaults.standard
	
	var itemArray = ["Chest", "Back", "Delts", "Legs", "Arms"]

	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
			itemArray = items
		}
		
	}
		//MARK - Tableview Datasource Methhod
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return itemArray.count
		
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
		
		cell.textLabel?.text = itemArray[indexPath.row]
		
		return cell
		
	}
	
	//MARK - Tableview Delegate Method
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		//		print(itemArray[indexPath.row])
		
		if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
			
			tableView.cellForRow(at: indexPath)?.accessoryType = .none
		
		} else {
			
			tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
			
		}
		
		tableView.deselectRow(at: indexPath, animated: true)
		
		
	}
	
	//MARK - Add New Items
	
	@IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
	
	var textField = UITextField()
		
	let alert = UIAlertController(title: "Add ToDo Item", message: "", preferredStyle: .alert)
		
	let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
		//What will happen once the user clicks the Add Item button on out UIAlert
		
		self.itemArray.append(textField.text!)
		
		// 
		self.defaults.setValue(self.itemArray, forKey: "ToDoListArray")
		
		self.tableView.reloadData()
		
		}
		
		alert.addTextField { (alertTextField) in
			alertTextField.placeholder = "Create new item"
			textField = alertTextField
			
			
			
		}
	
	alert.addAction(action)
		
	present(alert, animated: true, completion: nil)
		
	
	}

}

