String asciiCharType(int char) {
  const space = 32;
  const zero = 48;
  const nine = 57;
  const uppercaseA = 65;
  const uppercaseZ = 90;
  const lowercaseA = 97;
  const lowercaseZ = 122;

  return switch (char) {
    < space => 'control',
    == space => 'space',
    > space && < zero => 'punctuation',
    >= zero && <= nine => 'digit',
    >= uppercaseA && <= uppercaseZ => 'uppercase letter',
    >= lowercaseA && <= lowercaseZ => 'lowercase letter',
    _ => 'unknown'
  };
}

void main() {
  print(asciiCharType(32)); // Çıktı: space
  print(asciiCharType(65)); // Çıktı: uppercase letter
  print(asciiCharType(97)); // Çıktı: lowercase letter
  print(asciiCharType(33)); // Çıktı: punctuation
  print(asciiCharType(64)); // Çıktı: unknown
}
