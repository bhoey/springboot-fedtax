INSERT INTO filing_statuses (name)  VALUES ('Single');
INSERT INTO filing_statuses (name)  VALUES ('Head Of Household');
INSERT INTO filing_statuses (name)  VALUES ('Married Filing Jointly or Qualified Widow');
INSERT INTO filing_statuses (name)  VALUES ('Married Filing Separately');

------------------------------------------------------------------------------------------
-- 2023
------------------------------------------------------------------------------------------
INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
VALUES (2023, 0.1,          0,   11000, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2023, 0.12,    11001,    44725, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2023, 0.22,    44726,    95375, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2023, 0.24,    95376,   182100, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2023, 0.32,   182101,   231250, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2023, 0.35,   231251,   578125, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2023, 0.37,   578126,     null, (SELECT id FROM filing_statuses WHERE name = 'Single'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
VALUES (2023, 0.1,        0,  22000, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2023, 0.12,  22001,   89450, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2023, 0.22,  89451,  190750, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2023, 0.24, 190751,  364200, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2023, 0.32, 364201,  462500, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2023, 0.35, 462501,  693750, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2023, 0.37, 693751,    null, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
VALUES (2023, 0.1,       0,   15700, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2023, 0.12,  15701,   59850, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2023, 0.22,  59851,   95350, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2023, 0.24,  95351,  182100, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2023, 0.32, 182101,  231250, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2023, 0.35, 231251,  578100, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2023, 0.37, 578101,    null, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
VALUES (2023, 0.1,        0,   11000, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2023, 0.12,   11001,   44725, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2023, 0.22,   44726,   95375, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2023, 0.24,   95376,  182100, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2023, 0.32,  182101,  231250, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2023, 0.35,  231251,  346875, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2023, 0.37,  346876,    null, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately'));


------------------------------------------------------------------------------------------
-- 2022
------------------------------------------------------------------------------------------
INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
VALUES (2022, 0.1,          0,   10275, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2022, 0.12,    10276,    41775, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2022, 0.22,    41776,    89075, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2022, 0.24,    89075,   170050, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2022, 0.32,   170051,   215950, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2022, 0.35,   215950,   539900, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2022, 0.37,   539901,     null, (SELECT id FROM filing_statuses WHERE name = 'Single'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
VALUES (2022, 0.1,        0,  20550, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2022, 0.12,  20551,   83550, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2022, 0.22,  83551,  178150, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2022, 0.24, 178151,  340100, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2022, 0.32, 340101,  431900, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2022, 0.35, 431901,  647850, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2022, 0.37, 647851,    null, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
VALUES (2022, 0.1,       0,   14650, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2022, 0.12,  14651,   55900, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2022, 0.22,  55901,   89050, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2022, 0.24,  89051,  170050, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2022, 0.32, 170051,  215950, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2022, 0.35, 215951,  539900, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2022, 0.37, 539901,    null, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
VALUES (2022, 0.1,        0,   10275,  (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2022, 0.12,   10276,   41775,  (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2022, 0.22,   41776,   89075,  (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2022, 0.24,   89076,  170050,  (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2022, 0.32,  170051,  215950,  (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2022, 0.35,  215951,  323925,  (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2022, 0.37,  323926,    null, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately'));


------------------------------------------------------------------------------------------
-- 2021
------------------------------------------------------------------------------------------
INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
VALUES (2021, 0.1,        0,    9950, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2021, 0.12,    9951,   40525, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2021, 0.22,   40526,   86375, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2021, 0.24,   86376,  164925, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2021, 0.32,  164926,  209425, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2021, 0.35,  209426,  523600, (SELECT id FROM filing_statuses WHERE name = 'Single')),
       (2021, 0.37,  523601,    null, (SELECT id FROM filing_statuses WHERE name = 'Single'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
VALUES (2021, 0.1,        0, 19900, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2021, 0.12,  19901,  81050, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2021, 0.22,  81051, 172750, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2021, 0.24, 172751, 329850, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2021, 0.32, 329851, 418850, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2021, 0.35, 418851, 628300, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
       (2021, 0.37, 628301,   null, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
VALUES (2021, 0.1,       0,  14200, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2021, 0.12,  14201,  54200, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2021, 0.22,  54201,  86350, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2021, 0.24,  86351, 164900, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2021, 0.32, 164901, 209400, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2021, 0.35, 209401, 523600, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
       (2021, 0.37, 523601,   null, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
VALUES (2021, 0.1,       0,   9950, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2021, 0.12,   9951,  40525, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2021, 0.22,  40526,  86375, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2021, 0.24,  86376, 164925, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2021, 0.32, 164926, 209425, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2021, 0.35, 209426, 314150, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
       (2021, 0.37, 314151,   null, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately'));


------------------------------------------------------------------------------------------
-- 2020
------------------------------------------------------------------------------------------
INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
    VALUES (2020, 0.1,      0,    9875, (SELECT id FROM filing_statuses WHERE name = 'Single')),
           (2020, 0.12,  9876,   40125, (SELECT id FROM filing_statuses WHERE name = 'Single')),
           (2020, 0.22,  40126,  85525, (SELECT id FROM filing_statuses WHERE name = 'Single')),
           (2020, 0.24,  85526, 183300, (SELECT id FROM filing_statuses WHERE name = 'Single')),
           (2020, 0.32, 163301, 207350, (SELECT id FROM filing_statuses WHERE name = 'Single')),
           (2020, 0.35, 207351, 518400, (SELECT id FROM filing_statuses WHERE name = 'Single')),
           (2020, 0.37, 518401,   null, (SELECT id FROM filing_statuses WHERE name = 'Single'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
    VALUES (2020, 0.1,       0,  19750, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
           (2020, 0.12,  19751,  80250, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
           (2020, 0.22,  80251, 171050, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
           (2020, 0.24, 171051, 326600, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
           (2020, 0.32, 326601, 414700, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
           (2020, 0.35, 414701, 622050, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
           (2020, 0.37, 622051,   null, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
    VALUES (2020, 0.1,       0,  14100, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
           (2020, 0.12,  14101,  53700, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
           (2020, 0.22,  53701,  85500, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
           (2020, 0.24,  85501, 163300, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
           (2020, 0.32, 163301, 207350, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
           (2020, 0.35, 207351, 518400, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
           (2020, 0.37, 622051,   null, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
    VALUES (2020, 0.1,       0,   9875, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
           (2020, 0.12,   9876,  40125, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
           (2020, 0.22,  40126,  85525, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
           (2020, 0.24,  85526, 163300, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
           (2020, 0.32, 163301, 207350, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
           (2020, 0.35, 207351, 311025, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
           (2020, 0.37, 311026,   null, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately'));

------------------------------------------------------------------------------------------
-- 2019
------------------------------------------------------------------------------------------
INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
    VALUES (2019, 0.1,      0,    9700, (SELECT id FROM filing_statuses WHERE name = 'Single')),
           (2019, 0.12,  9701,   39475, (SELECT id FROM filing_statuses WHERE name = 'Single')),
           (2019, 0.22,  39476,  84200, (SELECT id FROM filing_statuses WHERE name = 'Single')),
           (2019, 0.24,  84201, 160725, (SELECT id FROM filing_statuses WHERE name = 'Single')),
           (2019, 0.32, 160726, 204100, (SELECT id FROM filing_statuses WHERE name = 'Single')),
           (2019, 0.35, 204101, 510300, (SELECT id FROM filing_statuses WHERE name = 'Single')),
           (2019, 0.37, 510301,   null, (SELECT id FROM filing_statuses WHERE name = 'Single'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
    VALUES (2019, 0.1,       0,  19400, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
           (2019, 0.12,  19401,  78950, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
           (2019, 0.22,  78951, 168400, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
           (2019, 0.24, 168401, 321450, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
           (2019, 0.32, 321451, 408200, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
           (2019, 0.35, 408201, 612350, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow')),
           (2019, 0.37, 612351,   null, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Jointly or Qualified Widow'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
    VALUES (2019, 0.1,       0,  13850, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
           (2019, 0.12,  13851,  52850, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
           (2019, 0.22,  52851,  84200, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
           (2019, 0.24,  84201, 160700, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
           (2019, 0.32, 160701, 204100, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
           (2019, 0.35, 204001, 510300, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household')),
           (2019, 0.37, 510301,   null, (SELECT id FROM filing_statuses WHERE name = 'Head Of Household'));

INSERT INTO tax_brackets (tax_year, tax_rate, lower_bound, upper_bound, filing_status_id)
    VALUES (2019, 0.1,       0,   9700, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
           (2019, 0.12,   9701,  39475, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
           (2019, 0.22,  39476,  84200, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
           (2019, 0.24,  84201, 160725, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
           (2019, 0.32, 160726, 204100, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
           (2019, 0.35, 204101, 306175, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately')),
           (2019, 0.37, 306176,   null, (SELECT id FROM filing_statuses WHERE name = 'Married Filing Separately'));
