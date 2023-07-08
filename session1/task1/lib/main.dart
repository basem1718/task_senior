CtoF(num c) {
  return c * 9 / 5 + 32;
}

FtoC(num f) {
  return (f - 32) * 5 / 9;
}

main() {
  int len;

  var type;

  var number;

  List temp = ["222C", "30C", "50F", "40C", "23F"];

  for (var data in temp) {
    len = data.length;

    type = data[len - 1];

    number = data.substring(0, len - 1);

    number = int.parse(number);

    if (type == "C") {
      print(" $number  ${CtoF(number)} ");
    } else {
      print(" $number ${FtoC(number)} ");
    }
  }
}
