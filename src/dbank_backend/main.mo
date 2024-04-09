import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
stable var currentValue: Float = 300;
/* currentValue := 100; */

stable var startTime = Time.now();
Debug.print(debug_show(startTime));

let _id = 199712345633245;
/* Debug.print(debug_show(id)); */

public func topUp(amount: Float) {
currentValue += amount;
Debug.print(debug_show(currentValue));
};

public func withdrawl(amount: Float) {
let tempValue: Float = currentValue - amount;
  if (tempValue - amount >= 0) {
currentValue -= amount;
Debug.print(debug_show(currentValue));
} else {
    Debug.print("An error has occured, currentValue less than zero.");
}
};


public query func checkBalance(): async Float {
return currentValue;
}; 


/* topUp(); */

public func compound() {
let currentTime = Time.now();
let timeElapsedNS = currentTime - startTime;
let timeElapsedS = timeElapsedNS / 1000000000;
currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
startTime := currentTime;
}; 

}



