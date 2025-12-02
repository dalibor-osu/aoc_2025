#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char *path = "./input.txt";

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
    int rotation = atoi(line + 1);
    printf("DIR: %d, ROT: %d\n", direction, rotation);
    for (int i = 0; i < rotation; i++) {
        number += direction;
        if (number == 100) {
            number = 0;
        } else if (number == -1) {
            number = 99;
            continue;
        }
        if (number == 0) {
            result++;
        }
    }
    printf("NUM: %d\n", number);
  }

  fclose(file);
  printf("result: %d\n", result);
  return 0;
}
