#include <cstdio>
#include <iostream>
using namespace std;

class Foo {
  int val;
  int val2;

public:
  string foo;
};

int main(int argc, char *argv[]) {
  Foo *foo = new Foo();
  foo->foo = "This is a string of characters";
  printf("The value is '%s'\n", foo->foo.c_str());
}
