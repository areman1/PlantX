#include <dht.h>

#define DHT11_PIN 7

dht DHT;

const int sensorMin = 0;      // sensor minimum, discovered through experiment
const int sensorMax = 600;    // sensor maximum, discovered through experiment

void setup() {
  pinMode(3, INPUT);//Moisture at digital pin 3
  pinMode(6, INPUT);//Humidity sensor at digital pin 6
  Serial.begin(9600);
  delay(1000);
}


void loop() { 
  int readLight = analogRead(A0);
  int light = (readLight/4.5);
  if(light > 100){
    light = 100;
  }
  int readMoisture = analogRead(A1);
  int range = map(readMoisture, sensorMin, sensorMax, 0, 3);
  String moisture = ""; 
  switch (range) {
    case 0:   
     moisture = "Dry";
      break;
    case 1:  
      moisture = "Normal";
      break;
    case 2: 
       moisture = "Damp";
      break;
    case 3:  
      moisture = "Turgid";
      break;
  }
  
  int chk = DHT.read11(DHT11_PIN);
  double temp = (DHT.temperature * 9/5) +32; //Farenheit
  Serial.println(String(light) + ", " + String(moisture) + ", " + String(temp) + ", " + String(DHT.humidity));//humidity in percentage
  delay(1000);
}
