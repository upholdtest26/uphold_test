#include <iostream>

int main() {
  try {
    std::string str;
    if (std::getline(std::cin, str, ',')) {
      if (str.size() < 2 || str.front() != '"' || str.back() != '"') {
       std::cerr << "\ninvalid input - string is not double-quoted";
       return 1;
      }

      std::string X_str;
      std::cin >> X_str;
      if (X_str.empty() || X_str.front() == '-') {
        std::cerr << "\ninvalid input - X is empty or negative";
        return 1;
      }

      size_t digit_num = 0;
      size_t X = std::stoul(X_str);
      for (size_t i = 0; i < str.size(); ++i) {
        char ch = str[i];
        if (isdigit(ch)) {
          ++digit_num;
        } else {
          if (digit_num > 0) {
            if (digit_num < X) {
              std::cout << std::string(X - digit_num, '0');
            }

            std::cout << std::string_view(str.data() + i + - digit_num, digit_num);
            digit_num = 0;
          }

          std::cout << ch;
        }
      }

      if (digit_num > 0) {
        if (digit_num < X) {
          std::cout << std::string(X - digit_num, '0');
        }
        
        std::cout << std::string_view(str.data() + str.size() - digit_num, digit_num);
      }

      return 0;
    } else {
      std::cerr << "\ncannot read input string";
    }
  } catch (std::exception& e) {
    std::cerr << "\nGot exception -> [" << e.what() << "]\n";
  }
    
  return 1;
}