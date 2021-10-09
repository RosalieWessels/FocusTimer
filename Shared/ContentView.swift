//
//  ContentView.swift
//  Shared
//
//  Created by Rosalie Wessels on 9/25/21.
//

import SwiftUI

struct ContentView: View {
    @State var screenWidth = UIScreen.main.bounds.width
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Menlo-Bold", size: 30)!, .foregroundColor : UIColor(Color("darkBlue"))]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color(.white).edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical) {
                    
                    TimerView(screenWidth: screenWidth)
                    
                    Text("Tasks:")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(Color("darkBlue"))
                        .padding(.top)
                    
                    TaskView(taskName: "Finish math homework", completed: false)
                    
                    TaskView(taskName: "English reading", completed: false)
                    
                    TaskView(taskName: "Do coding lesson", completed: false)
                    
                    TaskView(taskName: "Writing essay", completed: false)
                    
                    AddView()
                    
                }
            }
            .padding(.top)
            .navigationBarTitle(Text("FocusTimer."), displayMode: .inline)
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "gearshape.fill")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerView: View {
    var screenWidth : CGFloat
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color("blue"), lineWidth: 20)
                .frame(width: screenWidth - 140, height:  screenWidth - 140)
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(Color("darkBlue"), lineWidth: 8)
                .overlay(
                    Text("25:00")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(Color("darkBlue"))
                )
            
        }
        .frame(width: UIScreen.main.bounds.width - 50)
        .padding(.vertical, 40)
        .background(Color("lightBlue").opacity(0.9))
        .cornerRadius(20)
    }
}

struct TaskView: View {
    @State var taskName : String
    @State var completed : Bool
    var body: some View {
        Toggle(isOn: $completed) {
            Text(taskName)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(Color("blue"))
        }
        .toggleStyle(SwitchToggleStyle(tint: Color("darkBlue")))
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("lightBlue"))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct AddView: View {
    var body: some View {
        HStack {
            Text("Add Task")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(Color("blue"))
            
            Spacer()
            
            Image(systemName: "plus.app")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(Color("blue"))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("lightBlue"))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}
