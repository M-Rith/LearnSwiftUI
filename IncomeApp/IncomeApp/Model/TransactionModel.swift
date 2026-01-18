//
//  TransactionModel.swift
//  IncomeApp
//
//  Created by USER on 18/1/26.
//

import Foundation

struct Transaction : Identifiable {
    let id = UUID();
    let title : String;
    let amount : Double;
    let date : Date;
    
    
}
