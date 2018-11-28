#include <ros.h>
#include <std_msgs/Int16.h>

ros::NodeHandle nh;
std_msgs::Int16 str_int;

ros::Publisher chatter("chatter",&str_int);
int liczba = 0;

void setup() {
  nh.initNode();
  nh.advertise(chatter);
}

void loop() {
  // Wczytanie wartosci analogowej
  liczba = analogRead(A0);
  // Uzupelnienie struktury
  str_int.data = liczba;
  // Wyslanie
  chatter.publish(&str_int);
  nh.spinOnce();
  delay(1000);
}
