  CREATE TABLE `cs_students_staging2` (
	MainBranch VARCHAR(100),
    Age INT,
    Gender VARCHAR(100),
    Country VARCHAR(30),
    Student VARCHAR(25),
    EdLevel VARCHAR(100),
    SocialMedia VARCHAR(30),
    LanguageWorkedWith VARCHAR(30),
    LanguageDesireNextYear VARCHAR(30),
    DatabaseWorkedWith VARCHAR(35),
    DatabaseDesiredNextYear VARCHAR(35),
    PlatformWorkedWith VARCHAR(30),
    PlatformDesiredNextYear VARCHAR(30),
    WebFrameWorkedWith VARCHAR(35),
    WebFrameDesiredNextYear VARCHAR(35),
    DevEnviron VARCHAR(35)
    ) ; 

INSERT INTO cs_students_staging2
SELECT *
FROM cs_students;

UPDATE cs_students
SET MainBranch = "Developer"
WHERE MainBranch LIKE "I am a developer by profession";

UPDATE cs_students
SET MainBranch = "Not Developer"
WHERE MainBranch LIKE "I am not primarily a developer, but I write code sometimes as part of my work";

UPDATE cs_students
SET age = NULL
WHERE age = 0
;

SELECT gender
FROM cs_students
WHERE gender != "Man" AND gender != "Woman"
;

UPDATE cs_students
SET gender = null
WHERE gender != "Man" 
AND gender != "Woman" 
AND gender != "Non-binary, genderqueer, or gender non-conforming";

UPDATE cs_students
SET gender = "Non-Binary"
WHERE gender LIKE "Non-binary, genderqueer, or gender non-conforming";

UPDATE cs_students 
SET Country = "Hong Kong"
WHERE Country = "Hong Kong (S.A.R.)";

UPDATE cs_students 
SET Student = 'Y'
WHERE Student LIKE "Yes%";

UPDATE cs_students 
SET Student = 'N'
WHERE Student LIKE "No%";

UPDATE cs_students
SET Student = NULL 
WHERE Student NOT IN('Y', 'N')
;

UPDATE cs_students
SET EdLevel =
	CASE
		WHEN EdLevel = "Bachelor’s degree (BA, BS, B.Eng., etc.)" THEN "Bachelors"
		WHEN EdLevel = "Master’s degree (MA, MS, M.Eng., MBA, etc.)" THEN "Masters"
		WHEN EdLevel = "Associate degree" THEN "Associates"
		WHEN EdLevel = "Secondary school (e.g. American high school, German Realschule or Gymnasium, etc.)" THEN "Secondary School"
		WHEN EdLevel = "Professional degree (JD, MD, etc.)" THEN "Professional"
		WHEN EdLevel = "Other doctoral degree (Ph.D, Ed.D., etc.)" THEN "Doctorals"
        WHEN EdLevel = "Some college/university study without earning a degree" THEN "No Degree"
        WHEN EdLevel = "I never completed any formal education" THEN "No Formal Education"
        WHEN EdLevel = "Primary/elementary school" THEN "Primary School"
        ELSE NULL
	END;

UPDATE cs_students
SET SocialMedia = "None" 
WHERE SocialMedia = "I don't use social media" OR SocialMedia = ""
;

UPDATE cs_students
SET 
    LanguageWorkedWith = CASE WHEN LanguageWorkedWith = '' THEN NULL ELSE LanguageWorkedWith END,
    LanguageDesireNextYear = CASE WHEN LanguageDesireNextYear = '' THEN NULL ELSE LanguageDesireNextYear END,
	DatabaseWorkedWith = CASE WHEN DatabaseWorkedWith = '' THEN NULL ELSE DatabaseWorkedWith END,
    DatabaseDesiredNextYear = CASE WHEN DatabaseDesiredNextYear = '' THEN NULL ELSE DatabaseDesiredNextYear END,
	PlatformWorkedWith = CASE WHEN PlatformWorkedWith = '' THEN NULL ELSE PlatformWorkedWith END,
    PlatformDesiredNextYear = CASE WHEN PlatformDesiredNextYear = '' THEN NULL ELSE PlatformDesiredNextYear END,
	WebFrameWorkedWith = CASE WHEN WebFrameWorkedWith = '' THEN NULL ELSE WebFrameWorkedWith END,
    WebFrameDesiredNextYear = CASE WHEN WebFrameDesiredNextYear = '' THEN NULL ELSE WebFrameDesiredNextYear END,
    DevEnviron = CASE WHEN DevEnviron = '' THEN NULL ELSE DevEnviron END
    
WHERE 
    LanguageWorkedWith = '' 
    OR LanguageDesireNextYear = ''
    OR DatabaseWorkedWith  = ''
    OR DatabaseDesiredNextYear  = ''
    OR PlatformWorkedWith  = ''
    OR PlatformDesiredNextYear  = ''
    OR WebFrameWorkedWith  = ''
    OR WebFrameDesiredNextYear  = ''
    OR DevEnviron  = ''
    ;
    
SELECT DevEnviron
FROM cs_students
WHERE DevEnviron NOT IN ('Visual Studio Code', "Android Studio", "Atom", 
"Coda", "Eclipse", "Eclipse", "Emacs", "IntelliJ", 
"IPython / Jupyter", "NetBeans", "Notepad++", "PHPStorm", "PyCharm", "RStudio", "RubyMine", 
"Sublime Text", "Vim", "Visual Studio", "Visual Studio Code", "Xcode")
;


SELECT DevEnviron, 
       HEX(DevEnviron) AS hex_value
FROM cs_students
WHERE DevEnviron IS NOT NULL;

UPDATE cs_students
SET DevEnviron = REPLACE(DevEnviron, '\r', '')
WHERE DevEnviron IS NOT NULL;

UPDATE cs_students
SET DevEnviron = NULL
WHERE DevEnviron = "";


SELECT *
FROM cs_students
;
    
 