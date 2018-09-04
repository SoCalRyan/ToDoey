//
//  ViewController.swift
//  ToDoey
//
//  Created by Ryan Cornel on 9/4/18.
//  Copyright © 2018 Ryan Cornel. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
	
	let itemArray = ["Chest", "Back", "Delts", "Legs", "Arms"]

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
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
	
	
}

