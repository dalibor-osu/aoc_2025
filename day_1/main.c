#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char *path = "./test.txt";

int main() {
  FILE *file = fopen(path, "r");
  if (file == NULL) {
    fprintf(stderr, "Failed to open a file!");
    return 1;
  }

  char line[16];
  int number = 50;
  int result = 0;

  while (fgets(line, sizeof(line), file)) {
    short direction = line[0] == 'R' ? 1 : -1;

    char numBuffer[15];
    memcpy(numBuffer, line + 1, 15);

    int rotation = atoi(numBuffer) * direction;
    number += rotation;

    while (number < 0) {
        number = 100 + number;
    }

    while (number > 99) {
        number -= 100;
    }

    if (number == 0) {
        result++;
    }
  }

  printf("result: %d\n", result);
  fclose(file);
  return 0;
}
