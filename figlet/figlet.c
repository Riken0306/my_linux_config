#include <stdio.h>
#include <stdlib.h>

void generate_ascii_art(const char* word) {
  char command[256];

  //Construct the command to call figlet with the provided word
  snprintf(command, sizeof(command), "figlet \"%s\"", word);
  system(command);
  
  // Specify the font (slant) for an italicized effect
  snprintf(command, sizeof(command), "figlet -f slant \"%s\"", word);
  system(command);
}

int main() {
  char word[100];

  // Get the word from the user
  printf("Enter a word: ");
  scanf("%s", word);

  // Generate ASCII art
  generate_ascii_art(word);

  return 0;
}

