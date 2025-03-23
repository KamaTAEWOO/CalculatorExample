// 조건문 함수

bool isInvalidInput(String userInput, String value, List<String> operators) {
  // If input is empty and user tries to enter '0' or an operator
  if (userInput.isEmpty && (value == '0' || operators.contains(value))) {
    return false;
  }

  // If last character is already an operator and user tries to input another operator
  if (operators.contains(value)) {
    if (userInput.isEmpty || operators.contains(userInput[userInput.length - 1])) {
      return false;
    }
  }

  return true;
}