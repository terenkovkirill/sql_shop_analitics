WITH paired AS (
  SELECT
    campaign_id,
    verdict      AS v,
    verdict_time AS t_no,
    lead(verdict)      OVER (PARTITION BY campaign_id ORDER BY verdict_time) AS v_next,
    lead(verdict_time) OVER (PARTITION BY campaign_id ORDER BY verdict_time) AS t_yes
  FROM logs
)
SELECT
  date(t_no)          AS field_date,
  round(
    AVG(
      (julianday(t_yes) - julianday(t_no)) * 24*60
    )
  , 0)                 AS avg_wait_time
FROM paired
WHERE v = 'No'
  AND v_next = 'Yes'
GROUP BY field_date
ORDER BY field_date;