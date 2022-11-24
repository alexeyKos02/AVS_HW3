#include <stdio.h>
#include <string.h>

extern double Sqrt(double number);

int main(int args, char **argv) {
    FILE *in, *out;
    double number = -1;
    if (strcmp(argv[1], "-c") == 0) {
        printf("Enter number\n");
        scanf("%lf", &number);
        if (number < 0) {
            printf("Error");
            return 0;
        }
        double sq = Sqrt(number);
        printf("Answer = %lf\n", sq);
    } else if (strcmp(argv[1], "-f") == 0) {
        if (args != 4) {
            printf("Error");
            return 0;
        }
        in = (fopen(argv[2], "r") != NULL) ? fopen(argv[2], "r") : NULL;
        out = (fopen(argv[3], "w") != NULL) ? fopen(argv[3], "w") : NULL;
        if (in == NULL || out == NULL) {
            printf("Error");
            return 0;
        }
        fscanf(in, "%lf", &number);
        if (number < 0) {
            printf("Error");
            return 0;
        }
        double sq = Sqrt(number);
        fprintf(out, "%lf\n", sq);
    } else {
        printf("incorrect input");
    }
    return 0;
}