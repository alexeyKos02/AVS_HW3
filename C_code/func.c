#include <math.h>

static int degree = 5;
static double A = 0;

double Alg(double number) {
    return 1.0 / degree * ((degree - 1) * number + A / pow(number, degree - 1));
}

double Sqrt(double number) {
    A = number;
    double corr = pow(number, 1.0 / 5);
    double eps = corr / 1000;
    double alg = Alg(1);
    while (fabs(alg - corr) > eps) {
        alg = Alg(alg);
    }
    return alg;
}
