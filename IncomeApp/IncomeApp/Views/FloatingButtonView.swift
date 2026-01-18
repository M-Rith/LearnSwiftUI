//
//  FloatingButtonView.swift
//  IncomeApp
//
//  Created by USER on 18/1/26.
//

import SwiftUI

struct FloatingButtonView: View {

    @Binding var isAddTransaction: Bool

    var body: some View {
        VStack {
            Spacer()

            Button {
                isAddTransaction = true
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .frame(width: 75, height: 75)
                    .foregroundStyle(.white)
                    .background(.bg)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    FloatingButtonView(isAddTransaction: .constant(false))
}
