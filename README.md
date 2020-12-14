# iOSThemeManager
Subscriber-Publisher based framework for applying theme change to iOS apps

It works on the concept of `Observer patter`n where types of `Themeable` protocol (view controller and view) register as observers of `ThemeManager` so that `ThemeManager` could notify those `Themeable` objects when user changes application theme (type of `Theme` protocol). 
These observers are automatically removed from the list or registered observers when thy are removed from the view hierarchy to that there is no reference related issues.



