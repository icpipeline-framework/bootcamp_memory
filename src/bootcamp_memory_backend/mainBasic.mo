actor BootcampExampleStableMemory {
  var myFirstName : Text = "";
  stable var myLastName : Text = "";

  public shared(msg) func updateVars(): async Text {
      myFirstName := "Sherlock" ; 
      myLastName := "Holmes" ;
    return "OK";
  }; // end updateVars

  public query({caller}) func greet(name : Text) : async Text {
    return "Hello, " # name # 
              "! My name is " # 
              myFirstName # " " # myLastName # ".";

  };// end greet

}; // end actor