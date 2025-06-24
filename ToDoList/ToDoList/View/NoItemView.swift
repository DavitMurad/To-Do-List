//
//  NoItemView.swift
//  ToDoList
//
//  Created by Davit Muradyan on 23.06.25.
//

import SwiftUI

struct NoItemView: View {
    @State var isAnimating = false
    var body: some View {
        ScrollView {
            VStack {
                
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Ready to add a duty?")
                    .font(.caption)
                NavigationLink {
                    AddView()
                } label: {
                   Text("Add Something")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(isAnimating ? .purple : .blue)
                        .clipShape(isAnimating ? RoundedRectangle(cornerRadius: 15) : RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, isAnimating ? 40 : 60)
                        .scaleEffect(isAnimating ? 1.1 : 1.0)
                       
                }
                .shadow(color: isAnimating ? .purple : .blue , radius: isAnimating ? 10 : 5, x: 0, y: isAnimating ? 10 : 5)
                .offset(x: 0, y: 20)

            }
            .toolbar(.hidden)
            .padding(.vertical, 30)
            .onAppear(perform: addAnimate)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    func addAnimate() {
        guard !isAnimating else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeInOut(duration: 2).repeatForever()) {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemView()
    }
}
