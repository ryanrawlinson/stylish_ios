//
//  CategoryViewModel.swift
//  Stylish
//
//  Created by Ryan Rawlinson on 8/18/25.
//

import Foundation

class CategoryViewModel: ObservableObject {
    let category: Category
    
    @Published var isSelected: Bool = false
    
    init(category: Category) {
        self.category = category
    }
    
    func toggleSelection() {
        isSelected.toggle()
        print("Toggled selection for \(category.name). New state: \(isSelected)")
    }
}
