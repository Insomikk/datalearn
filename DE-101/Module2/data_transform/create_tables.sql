create schema homework;

CREATE TABLE homework.customer_dim
(
 customer_id_dim serial NOT NULL,
 customer_name   varchar(25) NOT NULL,
 segment         varchar(20) NOT NULL,
 customer_id     varchar(30) NOT NULL,
 CONSTRAINT PK_69 PRIMARY KEY ( customer_id_dim )
);

CREATE TABLE homework.geography_dim
(
 geographi_id serial NOT NULL,
 country      varchar(20) NOT NULL,
 city         varchar(25) NOT NULL,
 "state"        varchar(20) NOT NULL,
 postal_code  integer NOT NULL,
 CONSTRAINT PK_59 PRIMARY KEY ( geographi_id )
);



CREATE TABLE homework.order_date_dim
(
 order_date_id_dim serial NOT NULL,
 order_date        date NOT NULL,
 year              integer NOT NULL,
 quarter           integer NOT NULL,
 week              integer NOT NULL,
 day               integer NOT NULL,
 CONSTRAINT PK_14 PRIMARY KEY ( order_date_id_dim )
);


CREATE TABLE homework.product_dim
(
 product_id_dim serial NOT NULL,
 category       varchar(20) NOT NULL,
 sub_category   varchar(25) NOT NULL,
 product_name   varchar(130) NOT NULL,
 product_id     varchar(20) NOT NULL,
 CONSTRAINT PK_31 PRIMARY KEY ( product_id_dim )
);

CREATE TABLE homework.ship_date_dim
(
 ship_date_id serial NOT NULL,
 ship_date    date NOT NULL,
 year         integer NOT NULL,
 quarter      integer NOT NULL,
 manth        integer NOT NULL,
 week         integer NOT NULL,
 day          integer NOT NULL,
 CONSTRAINT PK_47 PRIMARY KEY ( ship_date_id )
);

CREATE TABLE homework.shipping_dim
(
 ship_id_dim serial NOT NULL,
 ship_mode   varchar(20) NOT NULL,
 CONSTRAINT PK_40 PRIMARY KEY ( ship_id_dim )
);




CREATE TABLE homework.sales_fact
(
 row_id            serial NOT NULL,
 order_id          varchar(50) NOT NULL,
 order_date_id_dim serial NOT NULL,
 customer_id_dim   serial NOT NULL,
 geographi_id      serial NOT NULL,
 ship_date_id      serial NOT NULL,
 ship_id_dim       serial NOT NULL,
 product_id_dim    serial NOT NULL,
 sales             numeric(9,4) NOT NULL,
 quantity          integer NOT NULL,
 discount          numeric(4,2) NOT NULL,
 profit            numeric(21,16) NOT NULL,
 returned          varchar(20) NOT NULL,
 CONSTRAINT PK_5 PRIMARY KEY ( row_id ),
 CONSTRAINT FK_35 FOREIGN KEY ( product_id_dim ) REFERENCES homework.product_dim ( product_id_dim ),
 CONSTRAINT FK_42 FOREIGN KEY ( ship_id_dim ) REFERENCES homework.shipping_dim ( ship_id_dim ),
 CONSTRAINT FK_54 FOREIGN KEY ( ship_date_id ) REFERENCES homework.ship_date_dim ( ship_date_id ),
 CONSTRAINT FK_64 FOREIGN KEY ( geographi_id ) REFERENCES homework.geography_dim ( geographi_id ),
 CONSTRAINT FK_73 FOREIGN KEY ( customer_id_dim ) REFERENCES homework.customer_dim ( customer_id_dim ),
 CONSTRAINT FK_78 FOREIGN KEY ( order_date_id_dim ) REFERENCES homework.order_date_dim ( order_date_id_dim )
);

CREATE INDEX FK_37 ON homework.sales_fact
(
 product_id_dim
);

CREATE INDEX FK_44 ON homework.sales_fact
(
 ship_id_dim
);

CREATE INDEX FK_56 ON homework.sales_fact
(
 ship_date_id
);

CREATE INDEX FK_66 ON homework.sales_fact
(
 geographi_id
);

CREATE INDEX FK_75 ON homework.sales_fact
(
 customer_id_dim
);

CREATE INDEX FK_80 ON homework.sales_fact
(
 order_date_id_dim
);






