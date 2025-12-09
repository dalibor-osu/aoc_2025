import java.io.File;                  // Import the File class
import java.io.FileNotFoundException; // Import this class to handle errors
import java.util.Scanner;             // Import the Scanner class to read text files
import java.util.Arrays;

void main() throws FileNotFoundException {
    var rows = new ArrayList<String[]>();

    var reader = new Scanner(new File("input.txt"));
    while (reader.hasNextLine())
        rows.add(reader.nextLine().trim().split("\\s+"));

    int columnCount = rows.get(0).length;
    long[] columnResults = new long[columnCount];

    for (int column = 0; column < columnCount; column++) {
        char operationChar = rows.get(rows.size() - 1)[column].charAt(0);
        columnResults[column] = operationChar == '+' ? 0 : 1;
        for (int row = 0; row < rows.size() - 1; row++) {
            var num = Long.parseLong(rows.get(row)[column]);
            if (operationChar == '+') {
                columnResults[column] += num;
            } else {
                columnResults[column] *= num; 
            }
        }
    }

    IO.println(Arrays.stream(columnResults).sum());
}
