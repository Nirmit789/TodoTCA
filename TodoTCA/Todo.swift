//
//  Todo.swift
//  TodoTCA
//
//  Created by Nirmit Patel on 07/07/23.
//

import ComposableArchitecture
import SwiftUI

/*
 This struct represent the a individual todo task.
 Todo task itself does not have any action so Action and Body has boiler plate code.
 
 Here Reducer is empty but in actual reducer is important aspect of The Composable Architecture.
 All busiess logic need to be written under Reducer or i mean Body variable of RedcuerProtocol.
 To understand it well kindly check reducer in Todos.swift
 */

struct Todo: ReducerProtocol {
    struct State: Equatable, Identifiable {
      @BindingState var description = ""
      let id: UUID
      @BindingState var isComplete = false
    }
    
    enum Action: BindableAction, Equatable, Sendable {
      case binding(BindingAction<State>)
    }
    
    var body: some ReducerProtocol<State, Action> {
      BindingReducer()
    }
}

/*
 This is View implementation.
 
 The confusion you might have from where this store object created.
 The Answer is, Store here in Todo.swift is subset of Store in Todos.swift.
 It will autometically created. We just need to pass State object.
 
 
 
 Another confusing thing may be flow. how this state is being updated and how UI is updated on state update.
 The Answer is, Actually this is buty of The composible Architecture. As you declare some var in state as @BindingState then it will be changed autmetically when the parent state changes. So if some one update the variable in Todos.Swift state it will autometically update the state here and Swift UI has inbuild feature to update the UI on State variable changes.
 */
struct TodoView: View {
  let store: StoreOf<Todo>

  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      HStack {
        Button {
          viewStore.$isComplete.wrappedValue.toggle()
        } label: {
          Image(systemName: viewStore.isComplete ? "checkmark.square" : "square")
        }
        .buttonStyle(.plain)

        TextField("Untitled Todo", text: viewStore.$description)
      }
      .foregroundColor(viewStore.isComplete ? .gray : nil)
    }
  }
}
