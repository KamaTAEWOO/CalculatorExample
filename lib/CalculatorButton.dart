class CalculatorButton {
  final String value;

  const CalculatorButton._(this.value);

  static const clear = CalculatorButton._('C');
  static const toggleSign = CalculatorButton._('+/-');
  static const percent = CalculatorButton._('%');
  static const delete = CalculatorButton._('DEL');
  static const seven = CalculatorButton._('7');
  static const eight = CalculatorButton._('8');
  static const nine = CalculatorButton._('9');
  static const divide = CalculatorButton._('/');
  static const four = CalculatorButton._('4');
  static const five = CalculatorButton._('5');
  static const six = CalculatorButton._('6');
  static const multiply = CalculatorButton._('x');
  static const one = CalculatorButton._('1');
  static const two = CalculatorButton._('2');
  static const three = CalculatorButton._('3');
  static const subtract = CalculatorButton._('-');
  static const zero = CalculatorButton._('0');
  static const decimal = CalculatorButton._('.');
  static const equals = CalculatorButton._('=');
  static const add = CalculatorButton._('+');

  static const values = [
    clear,
    toggleSign,
    percent,
    delete,
    seven,
    eight,
    nine,
    divide,
    four,
    five,
    six,
    multiply,
    one,
    two,
    three,
    subtract,
    zero,
    decimal,
    equals,
    add,
  ];
}