# [[2023-02-06]]
#### Routes Example
1. in the VSCode terminal, run `flutter create projectName`
	- a directory should be created as follows:
	![[Pasted image 20230206154608.png]]
	- all code will go in the main.dart page
	![[Pasted image 20230206154738.png]]
	- this method creates a widget object, where we can create pages

#### Navigation Practice (Named Routes)
- we will practice navigating between screens using [this](https://docs.flutter.dev/cookbook/navigation/named-routes) tutorial
- to begin, perform the `flutter create projectName` command for default folders
1. create folder for each screen:
	![[Pasted image 20230206155146.png]]
2. create classes for each screen in the respective folders
	- *first page*
	![[Pasted image 20230206155351.png]]
	- *second page*
	![[Pasted image 20230206155421.png]]
3. define the routes in the `main.dart` file, inside of the Widget build() function for the *root* of the application
	- after the '//MaterialApp'
	BEFORE
	![[Pasted image 20230206155647.png]]
	AFTER
	![[Pasted image 20230206160520.png]]
4. inside of the secondPage class, create an event widget for going back to the firstPage
	![[Pasted image 20230206160747.png]]
	![[Pasted image 20230206160759.png]]
5. in the firstPage class, create an event widget for navigating to the secondPage
	![[Pasted image 20230206160931.png]]