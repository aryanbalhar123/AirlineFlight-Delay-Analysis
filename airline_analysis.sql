SELECT
    carrier_name,
    SUM(arr_flights) AS total_flights,
    SUM(arr_del15) AS delayed_flights,
    ROUND(
        100.0 * SUM(arr_del15) / NULLIF(SUM(arr_flights), 0),
        2
    ) AS delay_rate_percent
FROM airline_delay_cleaned
WHERE carrier_name <> 'Unknown'
GROUP BY carrier_name
ORDER BY delay_rate_percent DESC;
SELECT
    month,
    SUM(arr_flights) AS total_flights,
    SUM(arr_del15) AS delayed_flights,
    ROUND(
        100.0 * SUM(arr_del15) / NULLIF(SUM(arr_flights), 0),
        2
    ) AS delay_rate_percent
FROM airline_delay_cleaned
GROUP BY month
ORDER BY month;

SELECT
    SUM(carrier_delay) AS carrier_delay_minutes,
    SUM(weather_delay) AS weather_delay_minutes,
    SUM(nas_delay) AS nas_delay_minutes,
    SUM(security_delay) AS security_delay_minutes,
    SUM(late_aircraft_delay) AS late_aircraft_delay_minutes
FROM airline_delay_cleaned;
-- Airport-wise delay analysis
SELECT
    airport_name,
    SUM(arr_flights) AS total_flights,
    SUM(arr_del15) AS delayed_flights,
    ROUND(
        100.0 * SUM(arr_del15) / NULLIF(SUM(arr_flights), 0),
        2
    ) AS delay_rate_percent
FROM airline_delay_cleaned
GROUP BY airport_name
HAVING SUM(arr_flights) >= 100
ORDER BY delay_rate_percent DESC;