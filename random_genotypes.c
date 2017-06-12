#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
void showRandom_az();
/*
 * 
 */
int main(int argc, char** argv) {
    int rows,cols,i,j;
    int seedvalue;
    
    rows=atoi(argv[1]);
    cols=atoi(argv[2]);
    seedvalue=atoi(argv[3]);
    srand(seedvalue);

    for(i=0;i<rows;i++) 
    {
	printf("LOAD_SEQUENCE ");
        for(j=0;j<cols;j++)
        {
        showRandom_az(argv[4]);
        }
        printf("\n");
    }
    
    return (EXIT_SUCCESS);
}
void showRandom_az(char * c)
{      
    char ch;
    int maxIndex;
    
    maxIndex=strlen(c);
    ch=c[rand() % maxIndex];
    printf("%c",ch);
}

