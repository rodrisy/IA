import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;

public class ScheduleApp {
    public static void main(String[]args) {
    //state how many days in a cycle
        int cycleDays = 6;
    //state what day it is today
        int currentCycleDay = calculateCycleDay(LocalDate.now(), cycleDays);
    //print the result
        System.out.println("Today is cycle day: " + currentCycleDay);
    }

    private static int calculateCycleDay(LocalDate currentDate, int cycleDays) {

    // state start date 
        LocalDate startDay = LocalDate.of(currentDate.getYear(), 12, 1).with(TemporalAdjusters.firstInMonth(DayOfWeek.MONDAY));
        int daysBetween = (int)
    //calculates amount of days between today and the first day of schedule
        startDay.until(currentDate, java.time.temporal.ChronoUnit.DAYS);
    //divides amount of days between by the cycle days
        int cycleDay = (daysBetween % cycleDays) + 1;
            return cycleDay;
    }
}