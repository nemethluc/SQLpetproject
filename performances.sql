CREATE TABLE "partner" (
  "partnerid" SERIAL PRIMARY KEY,
  "name" varchar (50) NOT NULL,
  "vatnumber" INTEGER,
  "registrationnumber" INTEGER,
  "bankaccount" INTEGER,
  "address" varchar (50),
  "postaddress" varchar (50),
  "contactpersonid" INTEGER,
  "companytypeid" INTEGER,
  "invoicetypeid" INTEGER,
  "performerid" INTEGER
);

CREATE TABLE "companytype" (
  "companytypeid" SERIAL PRIMARY KEY,
  "name" varchar (30)
);

CREATE TABLE "performer" (
  "performerid" SERIAL PRIMARY KEY,
  "name" varchar (40),
  "email" varchar (30),
  "phone" varchar (15),
  "address" varchar (70)
);

CREATE TABLE "library" (
  "libraryid" SERIAL PRIMARY KEY,
  "name" varchar (40),
  "address" varchar (60),
  "email" varchar (30),
  "phone" varchar (15),
  "regionid" INTEGER
);

CREATE TABLE "performance" (
  "performanceid" SERIAL PRIMARY KEY,
  "partnerid" INTEGER,
  "contractid" INTEGER,
  "name" varchar (50),
  "description" varchar (444),
  "libraryid" INTEGER,
  "date"  TIMESTAMP,
  "fees" varchar (7),
  "performancetypeid" INTEGER,
  "agegroupid" INTEGER,
  "timeframe" INTEGER,
  "remarks" varchar (234)
);

CREATE TABLE "agegroup" (
  "agegroupid" SERIAL PRIMARY KEY,
  "name" varchar (20),
  "from" INTEGER,
  "to" INTEGER
);

CREATE TABLE "contactperson" (
  "contactpersonid" SERIAL PRIMARY KEY,
  "name" varchar (50),
  "title" varchar (30),
  "email" varchar (30),
  "phone" varchar (15)
);

CREATE TABLE "contactpersonofregion" (
  "contactpersonid" INTEGER,
  "regionid" INTEGER
);

CREATE TABLE "performancetype" (
  "performancetypeid" SERIAL PRIMARY KEY,
  "name" varchar (20)
);

CREATE TABLE "invoicetype" (
  "invoicetypeid" SERIAL PRIMARY KEY,
  "name" varchar (30)
);

CREATE TABLE "region" (
  "regionid" SERIAL PRIMARY KEY,
  "name" varchar (15),
  "contactpersonid" INTEGER
);

CREATE TABLE "contactpersonoflibrary" (
  "contactpersonid" INTEGER,
  "libraryid" INTEGER
);

ALTER TABLE "partner" ADD FOREIGN KEY ("partnerid") REFERENCES "performance" ("partnerid");

ALTER TABLE "library" ADD FOREIGN KEY ("libraryid") REFERENCES "performance" ("libraryid");

ALTER TABLE "library" ADD FOREIGN KEY ("libraryid") REFERENCES "contactpersonoflibrary" ("libraryid");

ALTER TABLE "contactperson" ADD FOREIGN KEY ("contactpersonid") REFERENCES "contactpersonoflibrary" ("contactpersonid");

ALTER TABLE "performancetype" ADD FOREIGN KEY ("performancetypeid") REFERENCES "performance" ("performancetypeid");

ALTER TABLE "performer" ADD FOREIGN KEY ("performerid") REFERENCES "partner" ("performerid");

ALTER TABLE "invoicetype" ADD FOREIGN KEY ("invoicetypeid") REFERENCES "partner" ("invoicetypeid");

ALTER TABLE "contactperson" ADD FOREIGN KEY ("contactpersonid") REFERENCES "contactpersonofregion" ("contactpersonid");

ALTER TABLE "region" ADD FOREIGN KEY ("regionid") REFERENCES "contactpersonofregion" ("regionid");

ALTER TABLE "region" ADD FOREIGN KEY ("regionid") REFERENCES "library" ("regionid");

ALTER TABLE "companytype" ADD FOREIGN KEY ("companytypeid") REFERENCES "partner" ("companytypeid");

ALTER TABLE "agegroup" ADD FOREIGN KEY ("agegroupid") REFERENCES "performance" ("agegroupid");
