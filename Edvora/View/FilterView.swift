//
//  FilterView.swift
//  Edvora
//
//  Created by Decagon on 28/02/2022.
//

import SwiftUI

struct FilterView: View {
    @ObservedObject private var citiesLoader: CitiesLoader
    
    var ridesLoader: RidesLoader
    
    init(ridesLoader: RidesLoader) {
        self.ridesLoader = ridesLoader
        citiesLoader = CitiesLoader(ridesLoader: ridesLoader)
    }
    
    var body: some View {
        VStack {
            Text("Filters")
            
            DropDownSelector(placeholder: "State", options: ridesLoader.stateDropDownOptions ?? []) { option in
                ridesLoader.sortRidesBy(state: option.value, citiesLoader: citiesLoader)
            }
            
            DropDownSelector(placeholder: "City", options: citiesLoader.cities) { option in
                ridesLoader.sortRidesBy(city: option.value)
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(ridesLoader: RidesLoader(networkService: NetworkService(), ref: 0))
    }
}
