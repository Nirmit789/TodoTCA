# TodoTCA

This Project tries to explain TCA - "The Composible Architecture" in very layman language.
Below is the breif about "The Composible Architecture". To understand the code well kindly go thorugh file "Todo.swift" first and then "Todos.swift".


You have to implement 4 major types of classes while adhering to "TCA"
1> State:- It represent current state of app.
2> Action:- It contains all the action possible within the app.
3> Reducer:- It is responsible to update the state.
4> Effect:- Sometime new state depends on data coming from external source like APi or database. So on some action reducer returns the effect. Which executes asynchronoysly and calls a other action. which reducer catchs and update the state with new data.

Change in State:-
When app state is updated then the changes is prpogated to view's state variable  thorugh binding.
View Calling Action:-
Similarly the view's action is prpogated to App action through mapper and app action get's called which will update app state through reducer and the changes progated to view's state and view is updated. This ensures only one state and that to always updated with correct Data.


To keep it simple we have taken very basic example. This example does not shows one of major feature of TCA which is Modularisation. In that case individual moduels have their different view store but got updated from App state only.
So Action propogated to main app which updated main app state and result in update to module state. In this way if some data or state variable changes which is used by multiple module all modules will have latest data. 
