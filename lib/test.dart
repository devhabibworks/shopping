void main(List<String> args) {
  print(divid(8, 5));
}

divid(int x, int y) {
  double result = 0;
  try {
    //
    result = x / y;
  } catch (e) {
    print(e);
  }

  return result;
}
