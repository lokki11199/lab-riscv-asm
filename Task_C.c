#include <stdio.h>

#define N 5
#define M 4

int process(int n, int m, int matrix [M][N])
{
    int min = matrix[0][0];
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            if(matrix[i][j] < min)
            	min = matrix[i][j];
        }
    }
    return min;
}

int main()
{
    int matrix[M][N];
        
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    int result = process(N, M, matrix);

    printf("%d ", result);


    return 0;
}
