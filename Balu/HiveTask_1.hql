//Task1_json


CREATE DATABASE IF NOT EXISTS kalyan;
USE kalyan;

ADD jar /usr/lib/hive-hcatalog/share/hcatalog/hive-hcatalog-core.jar;

DROP TABLE IF EXISTS employee1_json;
CREATE TABLE IF NOT EXISTS kalyan.employee1_json (empid INT, name STRING, salary STRING, dept STRING)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe';

LOAD DATA LOCAL INPATH "/home/orienit/Desktop/hive/employee1.json" OVERWRITE INTO TABLE kalyan.employee1_json;

DROP TABLE IF EXISTS employee1_op;
CREATE TABLE IF NOT EXISTS kalyan.employee1_op AS SELECT * FROM kalyan.employee1_json WHERE empid>2 AND dept='dev';
SELECT * FROM kalyan.employee1_op;







//Task1_xml


CREATE DATABASE IF NOT EXISTS kalyan;
USE kalyan;

ADD JAR /home/orienit/Desktop/hive/hivexmlserde-1.0.0.0.jar;

DROP TABLE IF EXISTS employee1_xml; 
CREATE TABLE IF NOT EXISTS kalyan.employee1_xml(empid INT,name STRING,salary INT,dept STRING)
ROW FORMAT SERDE 'com.ibm.spss.hive.serde2.xml.XmlSerDe'
WITH SERDEPROPERTIES (
"column.xpath.empid"="/employee/empid/text()",
"column.xpath.name"="/employee/name/text()",
"column.xpath.salary"="/employee/salary/text()",
"column.xpath.dept"="/employee/dept/text()"
)
STORED AS
INPUTFORMAT 'com.ibm.spss.hive.serde2.xml.XmlInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
TBLPROPERTIES (
"xmlinput.start"="<employee>",
"xmlinput.end"="</employee>"
);

LOAD DATA LOCAL INPATH "/home/orienit/Desktop/hive/employee1.xml" into table employee1_xml;
SELECT * FROM employee1_xml;
SELECT * FROM kalyan.employee1_xml WHERE empid>2 AND dept='dev';


//ERROR OCCURED While creating op table

//DROP TABLE IF EXISTS employee1xml_op;
//INSERT OVERWRITE TABLE kalyan.employee1xml_op AS SELECT * FROM kalyan.employee1_xml WHERE empid>2 AND dept='dev';
//SELECT * FROM kalyan.employee1xml_op;















