public class Main {
    public static void main(String[] args) {
        FinancialForecast forecast = new FinancialForecast();

        double initialAmount = 10000;
        double growthRate = 0.10; // 10% annual growth
        int years = 5;

        double futureValueRecursive = forecast.predictFutureValue(initialAmount, growthRate, years);
        double futureValueDP = forecast.predictFutureValueDP(initialAmount, growthRate, years);

        System.out.println("Future Value (Recursive): " + futureValueRecursive);
        System.out.println("Future Value (Optimized - DP): " + futureValueDP);
    }
}
