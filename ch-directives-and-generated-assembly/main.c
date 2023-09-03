char initialized_array[] = "Hello, World!";
int initialized_int = 10;
int uninitialized_int;

int function() {
  int initialized_local = initialized_int;
  int uninitialized_local;

  uninitialized_int = initialized_local + 1;

  uninitialized_local = uninitialized_int + 1;

  return uninitialized_local;
}
