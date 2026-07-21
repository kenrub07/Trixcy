import 'dart:io';

void main() {
  while (true) {
    print("\n=== STUDENT ASSISTANT ===");
    print("1. Budget Tracker");
    print("2. Grade Calculator");
    print("3. Exit");
    stdout.write("Enter your choice (1-3): ");

    int? choice = int.tryParse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        budgetTracker();
        break;
      case 2:
        gradeCalculator();
        break;
      case 3:
        print("Thank you for using the Student Assistant!");
        return;
      default:
        print("Invalid choice. Please enter 1, 2, or 3.");
    }
  }
}

// Budget Tracker
void budgetTracker() {
  print("\n=== Budget Tracker ===");

  double allowance = readPositiveDouble("Enter your monthly allowance: ");

  double food = readPositiveDouble("Food expense: ");
  double transport = readPositiveDouble("Transportation expense: ");
  double school = readPositiveDouble("School materials expense: ");
  double others = readPositiveDouble("Other expenses: ");

  double totalExpenses = food + transport + school + others;
  double remaining = allowance - totalExpenses;

  double percentFood = (food / allowance) * 100;
  double percentTransport = (transport / allowance) * 100;
  double percentSchool = (school / allowance) * 100;
  double percentOthers = (others / allowance) * 100;

  print("\n=== Budget Summary ===");
  print("Allowance: ₱${allowance.toStringAsFixed(2)}");
  print("Total Expenses: ₱${totalExpenses.toStringAsFixed(2)}");
  print("Remaining Balance: ₱${remaining.toStringAsFixed(2)}");

  print("\nExpense Percentages:");
  print("Food: ${percentFood.toStringAsFixed(2)}%");
  print("Transportation: ${percentTransport.toStringAsFixed(2)}%");
  print("School Materials: ${percentSchool.toStringAsFixed(2)}%");
  print("Others: ${percentOthers.toStringAsFixed(2)}%");

  if (totalExpenses > allowance) {
    print("Warning: Your plan exceeds your allowance!");
  } else if (totalExpenses == allowance) {
    print("You are spending exactly your allowance. No savings left.");
  } else if (totalExpenses < allowance &&
      remaining >= allowance * 0.20) {
    print("Great! You are saving at least 20% of your allowance.");
  } else {
    print("You are within budget, but your savings are less than 20%.");
  }
}

// Grade Calculator
void gradeCalculator() {
  print("\n=== Grade Calculator ===");

  int numberOfQuizzes;

  while (true) {
    stdout.write("Enter number of quizzes: ");
    numberOfQuizzes = int.tryParse(stdin.readLineSync()!) ?? 0;

    if (numberOfQuizzes > 0) {
      break;
    }

    print("Please enter a valid positive number.");
  }

  double totalQuiz = 0;
  int validEntries = 0;

  for (int i = 1; i <= numberOfQuizzes; i++) {
    double score;

    while (true) {
      stdout.write("Enter Quiz $i score (0-100): ");
      score = double.tryParse(stdin.readLineSync()!) ?? -1;

      if (score >= 0 && score <= 100) {
        break;
      }

      print("Invalid score. Enter a value from 0 to 100.");
    }

    totalQuiz += score;
    validEntries++;
  }

  double quizAverage = totalQuiz / numberOfQuizzes;

  double midtermScore = readScore("Enter Midterm Score (0-100): ");
  double finalScore = readScore("Enter Final Exam Score (0-100): ");

  double finalGrade =
      quizAverage * 0.30 +
      midtermScore * 0.30 +
      finalScore * 0.40;

  print("\n=== Grade Summary ===");
  print("Quiz Average: ${quizAverage.toStringAsFixed(2)}");
  print("Midterm Score: ${midtermScore.toStringAsFixed(2)}");
  print("Final Exam Score: ${finalScore.toStringAsFixed(2)}");
  print("Final Grade: ${finalGrade.toStringAsFixed(2)}");
  print("Valid Quiz Entries: $validEntries");

  if (finalGrade >= 90) {
    print("Excellent, Aliah! Grade: A");
  } else if (finalGrade >= 80) {
    print("Very good, Aliah! Grade: B");
  } else if (finalGrade >= 70) {
    print("Good, Aliah! Grade: C");
  } else if (finalGrade >= 60) {
    print("Needs improvement. Grade: D");
  } else {
    print("At risk, Aliah. Grade: F");
  }
}

double readPositiveDouble(String prompt) {
  while (true) {
    stdout.write(prompt);

    double? value = double.tryParse(stdin.readLineSync()!);

    if (value != null && value > 0) {
      return value;
    }

    print("Please enter a valid positive number.");
  }
}

double readScore(String prompt) {
  while (true) {
    stdout.write(prompt);

    double? score = double.tryParse(stdin.readLineSync()!);

    if (score != null && score >= 0 && score <= 100) {
      return score;
    }

    print("Score must be between 0 and 100.");
  }
}