import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;

import java.util.Scanner;

public class ScheduleApp {
    public static void main(String[]args) {
    //state how many days in a cycle
        int cycleDays = 6;
    //state what day it is today
        int currentCycleDay = calculateCycleDay(LocalDate.now(), cycleDays);
    //print the result
        System.out.println("Today is cycle day: " + currentCycleDay);
    // what is this user
        String username = getUsername();
        System.out.println("you are signed in as: " + username);
    // check if user exists
        String doesUserExist = ifUserExists(username);

    }

    private static int calculateCycleDay(LocalDate currentDate, int cycleDays) {

        // state start date 
        LocalDate startDay = LocalDate.of(currentDate.getYear(), 12, 1).with(TemporalAdjusters.firstInMonth(DayOfWeek.MONDAY));
        
        int daysBetween = (0);
        // if today isnt the start date add a day to count untiul the day on is the same as start date, dont add days if it is a weekend
        while (startDay.isBefore(currentDate)) {
            if (startDay.getDayOfWeek() != DayOfWeek.SATURDAY && startDay.getDayOfWeek() != DayOfWeek.SUNDAY) {
                daysBetween++;
            }
            startDay = startDay.plusDays(1);
        }
        //divides amount of days between by the cycle days
        int cycleDay = (daysBetween % cycleDays);
            return cycleDay;

    }

    private static String getUsername(){
        Scanner scanner = new Scanner(System.in);

        System.out.print("enter your username: ");
        String username = scanner.nextLine();

        System.out.println("you entered: " + username);
        
        scanner.close();
        return username;
    }

    private static String ifUserExists(String username){
        String correctUser = "2025rodrigo";
        String _username = username;
        
        if (_username != correctUser) {
            System.out.println("1invalid username");
            return correctUser;
        } else if (_username == correctUser) {
            System.out.println("invalid username");
            return correctUser;
        }
        return correctUser;
    }
}