//
//  SerachViewModel.swift
//  CovidApps
//
//  Created by Muhammad Ilyas on 25/12/22.
//

import Foundation

extension SearchView{
    class ViewModel: ObservableObject{
        private let services = Services()
        
        @Published var hospitals: [Hospital] = []
        @Published var searchText = ""
        
        var filteredHospitals: [Hospital] {
            return searchText == "" ? hospitals : hospitals.filter{
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
        
        init(){
            services.getHospital(){ data in
                print(data.count)
                DispatchQueue.main.async {
                    self.hospitals = data
                }
            }
            
        }
        
    }
}
