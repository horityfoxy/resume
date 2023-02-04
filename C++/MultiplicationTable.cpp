#include <iostream>
using namespace std;

int **create_two_dim_array(int rows, int cols) {
  int **arr = new int *[rows];
  for (int i = 0; i < rows; i++) {
    arr[i] = new int[cols];
  }
  return arr;
}

void fill_two_dim_array(int **arr, int rows, int cols) {
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      arr[j][i] = (j + 1) * (i + 1);
    }
  }
}

void print_two_dim_array(int **arr, int rows, int cols) {
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      cout << arr[j][i] << "\t";
    }
    cout << "\n";
  }
}

void delete_two_dim_array(int **arr, int rows) {
  for (int i = 0; i < rows; i++) {
    delete[] arr[i];
  }
  delete[] arr;
}

int main() {
  int a = 0, b = 0;
  cout << "Введите количество строк: ";
  cin >> a;
  cout << "Введите количество столбцов: ";
  cin >> b;
  if (a > 0 & b > 0) {
    int **arr = create_two_dim_array(a, b);
    fill_two_dim_array(arr, a, b);
    print_two_dim_array(arr, a, b);
    delete_two_dim_array(arr, a);
  } else {
    cout << "Числа должны быть больше нуля";
  }
}
