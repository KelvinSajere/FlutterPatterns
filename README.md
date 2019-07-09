# Flutter State Management Patterns

The Repository explains two of the several development patterns available in flutter. It uses the Camera API to explain the process
- BLOC-PROVIDER 
- PROVIDER 

## BLOC-PROVIDER
Check out the branch https://github.com/KelvinSajere/FlutterPatterns/tree/BlocCameraImplementation
### BLOC ====> Business Logic Component
:This is where the core business logic that affect the state of a widget is written. A BLOC takes in an event, returns a state. This state can be passed down to the child widget.

### BLOC PROVIDER PATTERN
BLOC PROVIDER ===> Provides the BLOC to the child widget

### BLOC BUILDER 
This enables the state to be read after an event has been triggered

