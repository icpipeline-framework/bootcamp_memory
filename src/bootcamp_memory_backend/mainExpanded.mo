
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import Time "mo:base/Time";
import Int "mo:base/Int";


actor BootcampExampleStableMemory {

  
  // ********************************************* 
  // ************* INIT  BEGIN *******************
  // *********************************************
  
  var now = Time.now();
  Debug.print("BEGIN INIT Time: " # Int.toText(now));

  var myFirstName : Text = "";
  stable var myLastName : Text = "";
  stable var myFirstNameStable : Text = "";
  
  // now if the stable version of the first name is there we have code to put it back in place

  if (myFirstNameStable != "" ) {

    // the the unstable version equal to the one you saved.
    myFirstName:= myFirstNameStable;

  }; // end if we have save version 

  // ********************************************* 
  // ************* INIT  END  ********************
  // *********************************************


  // ********************************************* 
  // ************* DAPP INTERFACES ***************
  // *********************************************

  public shared(msg) func updateVars(inputText: Text): async Text {


    now := Time.now();
    Debug.print("INSIDE UPDATE Time: " # Int.toText(now));
    Debug.print(debug_show(msg) ) ;
    Debug.print("inputText = " # inputText);
    

      myFirstName := "Sherlock" ; 
      myLastName := inputText ;


    return "OK";
  }; // end updateVars


  public query({caller}) func greet(name : Text) : async Text {

    now := Time.now();
    Debug.print("INSIDE GREET Time: " # Int.toText(now));
    
    Debug.print("the Caller Principal ID " # Principal.toText(caller));
    Debug.print(debug_show(Principal.fromActor(BootcampExampleStableMemory)));
    Debug.print("the CanisterId " # Principal.toText(Principal.fromActor(BootcampExampleStableMemory)));
    
    
    return "Hello, " # name # 
              "! Nice to Meet you. My name is " # 
              myFirstName # " " # myLastName # ".";

  };// end greet

  // ********************************************* 
  // ************* SYSTEM FUNCTIONS  *************
  // *********************************************
  system func preupgrade() {
      
      now := Time.now();

      Debug.print("PREUPGRADE Time: " # Int.toText(now));
      //myFirstNameStable := myFirstName ;


      
  };// preupgrade

  system func postupgrade() {

      now := Time.now();

      Debug.print("POSTUPGRADE Time: " # Int.toText(now));

  };// postupgrade

}; // end actor 
