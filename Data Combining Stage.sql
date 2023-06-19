## Data Combining Stage

DROP TABLE IF EXISTS `Alltrips.combined_data`;

-- combining all the 12 months data tables into a single table containing data from Jan 2022 to Dec 2022.

CREATE TABLE IF NOT EXISTS `Alltrips.combined_data` AS (
  SELECT * FROM `cyclist-case-study-1.Alltrips.2022jan`
  UNION ALL
  SELECT * FROM `cyclist-case-study-1.Alltrips.2022feb`
  UNION ALL
  SELECT * FROM `cyclist-case-study-1.Alltrips.2022mar`
  UNION ALL
  SELECT * FROM `cyclist-case-study-1.Alltrips.2022apr`
  UNION ALL
  SELECT * FROM `cyclist-case-study-1.Alltrips.2022may`
  UNION ALL
  SELECT * FROM `cyclist-case-study-1.Alltrips.2022jun`
  UNION ALL
  SELECT * FROM `cyclist-case-study-1.Alltrips.2022jul`
  UNION ALL
  SELECT * FROM `cyclist-case-study-1.Alltrips.2022aug`
  UNION ALL
  SELECT * FROM `cyclist-case-study-1.Alltrips.2022sep`
  UNION ALL
  SELECT * FROM `cyclist-case-study-1.Alltrips.2022oct`
  UNION ALL
  SELECT * FROM `cyclist-case-study-1.Alltrips.2022nov`
  UNION ALL
  SELECT * FROM `cyclist-case-study-1.Alltrips.2022dec`
);

## To check nunmber of rows which are 5,667,717

SELECT * FROM `cyclist-case-study-1.Alltrips.combined_data`
