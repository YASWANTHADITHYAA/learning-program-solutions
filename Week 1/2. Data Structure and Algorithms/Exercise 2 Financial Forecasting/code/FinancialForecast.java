public class FinancialForecast {

    public double predictFutureValue(double initialAmount, double growthRate, int years) {
        if (years == 0) {
            return initialAmount;
        }
        return predictFutureValue(initialAmount, growthRate, years - 1) * (1 + growthRate);
    }

    public double predictFutureValueDP(double initialAmount, double growthRate, int years) {
        double[] dp = new double[years + 1];
        dp[0] = initialAmount;
        for (int i = 1; i <= years; i++) {
            dp[i] = dp[i - 1] * (1 + growthRate);
        }
        return dp[years];
    }
}
