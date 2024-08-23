#include <WiFi.h>
#include <WebServer.h>

const char* ssid = "mpmc";
const char* password = "clarence123";
WebServer server(80);

const int ledPin = 23;

unsigned long ledOnTime = 0;
const long duration = 10000;
bool ledState = false;

int pwm_motor = 22;
int in1 = 15;
int in2 = 2;


void handleOn() {
  analogWrite(pwm_motor, 100);
  digitalWrite(in1, HIGH);
  digitalWrite(in2, LOW);
  delay(100); 
  analogWrite(pwm_motor, 0);
  digitalWrite(in1, LOW);
  digitalWrite(in2, LOW);
  Serial.println("Direction Changed");
  digitalWrite(ledPin, HIGH);
  Serial.println("Door Locked!");
  server.send(200, "text/plain", "LED is ON for 10 seconds");
}

void handleOff() {
  analogWrite(pwm_motor, 80);
  digitalWrite(in1, LOW);
  digitalWrite(in2, HIGH);
  delay(100);
  analogWrite(pwm_motor, 0);
  digitalWrite(in1, LOW);
  digitalWrite(in2, LOW);
  Serial.println("Direction Changed");
  digitalWrite(ledPin, LOW);
  Serial.println("Door Unlocked!");
  server.send(200, "text/plain", "LED is TURNED OFF");
}

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
  pinMode(pwm_motor, OUTPUT);
  pinMode(in1, OUTPUT);
	pinMode(in2, OUTPUT);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }

  Serial.println("Connected to WiFi");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  server.on("/on", handleOn);
  server.on("/off", handleOff);
  server.begin();

}

void loop() {
  server.handleClient();
}
