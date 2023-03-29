/*
 * main.c
 *
 */
 
 #include <stdio.h>
 #include <stdbool.h>
 #include <stdint.h>
 
 int main()
{
   volatile uint32_t count; // Making voltaile so it doesnt get optimised out!
   volatile uint32_t n_loops = 0; // Making voltaile so it doesnt get optimised out!

   while(true)
   {
      printf("\r\nHello There!");
      count = 0;
      while(3141593 > count++) // Waste some time! 
      {
         // Do Nothing!
      }

      if (314158 < n_loops++)
      {
         printf("\r\nFine, Ignore me then!\r\nSee if I care :P");
      }
   }
   return -1;
}
