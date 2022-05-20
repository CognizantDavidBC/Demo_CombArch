//
//  FirstDetailView.swift
//  Coordinator
//
//  Created by m_944879 on 19/5/22.
//

import SwiftUI

struct FirstDetailView: View {
    @ObservedObject var viewModel: FirstTabViewModel
    
    var body: some View {
        VStack {
            Text("First details")
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Mail", text: $viewModel.mail)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct FirstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDetailView(viewModel: FirstTabViewModel())
    }
}
