CREATE TABLE colors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    color VARCHAR(255) NOT NULL
) ENGINE=INNODB;

CREATE TABLE storage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    storage INT NOT NULL comment 'Storage value in GB'
) ENGINE=INNODB;

CREATE TABLE phones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL
) ENGINE=INNODB;

CREATE TABLE phone_color (
    phone_id INT NOT NULL,
    color_id INT NOT NULL,
    image_url VARCHAR(255),
    FOREIGN KEY (phone_id) REFERENCES phones(id),
    FOREIGN KEY (color_id) REFERENCES colors(id)
) ENGINE=INNODB;


CREATE TABLE phone_storage (
    phone_id INT NOT NULL,
    storage_id INT NOT NULL,
    FOREIGN KEY (phone_id) REFERENCES phones(id),
    FOREIGN KEY (storage_id) REFERENCES storage(id)
) ENGINE=INNODB;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
) ENGINE=INNODB;

CREATE TABLE cart (
    user_id INT NOT NULL,
    phone_id INT NOT NULL,
    color_id INT NOT NULL,
    storage_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (phone_id) REFERENCES phones(id),
    FOREIGN KEY (color_id) REFERENCES colors(id),
    FOREIGN KEY (storage_id) REFERENCES storage(id)
) ENGINE=INNODB;

INSERT INTO colors(color)
VALUES ('Blue'), ('Yellow'), ('Red'), ('Black'), ('White'), ('Light Blue'), ('Green'), ('Gray'), ('Multi color'), ('Orange')

INSERT INTO storage(storage)
VALUES (16), (32), (64), (128), (256), (512)

INSERT INTO phones(brand, model)
VALUES
    ('Apple','iPhone SE'),
    ('Apple','iPhone Xr'),
    ('Apple','iPhone 11'),
    ('Apple','iPhone 12'),
    ('OnePlus','OnePlus 9'),
    ('OnePlus','OnePlus Nord'),
    ('OnePlus','OnePlus Nord N100'),
    ('OnePlus','OnePlus 8T'),
    ('OnePlus','OnePlus 8T Pro'),
    ('OnePlus','OnePlus 8'),
    ('Xiaomi','Mi 11'),
    ('Xiaomi','Mi 11 Ultra'),
    ('Xiaomi','Mi 10T'),
    ('Xiaomi','POCO X3'),
    ('Xiaomi','Redmi 9T')

INSERT INTO phone_color(phone_id,color_id,image_url)
VALUES
    ((select id from phones where model='iPhone SE'),(select id from colors where color='White'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-se-white-select-2020?wid=470&hei=556&fmt=png-alpha&.v=1586574259457'),
    ((select id from phones where model='iPhone SE'),(select id from colors where color='Black'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-se-black-select-2020?wid=470&hei=556&fmt=png-alpha&.v=1586574260051'),
    ((select id from phones where model='iPhone SE'),(select id from colors where color='Red'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-se-red-select-2020?wid=470&hei=556&fmt=png-alpha&.v=1586574260319'),
    ((select id from phones where model='iPhone Xr'),(select id from colors where color='White'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-xr-white-select-201809?wid=470&hei=556&fmt=p-jpg&qlt=95&.v=1551226036668'),
    ((select id from phones where model='iPhone Xr'),(select id from colors where color='Black'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-xr-black-select-201809?wid=470&hei=556&fmt=p-jpg&qlt=95&.v=1551226038992'),
    ((select id from phones where model='iPhone Xr'),(select id from colors where color='Blue'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-xr-blue-select-201809?wid=470&hei=556&fmt=p-jpg&qlt=95&.v=1565209264208'),
    ((select id from phones where model='iPhone Xr'),(select id from colors where color='Yellow'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-xr-yellow-select-201809?wid=470&hei=556&fmt=p-jpg&qlt=95&.v=1551226036826'),
    ((select id from phones where model='iPhone 11'),(select id from colors where color='White'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone11-white-select-2019?wid=470&hei=556&fmt=png-alpha&.v=1566956148115'),
    ((select id from phones where model='iPhone 11'),(select id from colors where color='Black'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone11-black-select-2019?wid=470&hei=556&fmt=png-alpha&.v=1566956144418'),
    ((select id from phones where model='iPhone 11'),(select id from colors where color='Green'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone11-green-select-2019?wid=470&hei=556&fmt=png-alpha&.v=1566956144838'),
    ((select id from phones where model='iPhone 11'),(select id from colors where color='Yellow'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone11-yellow-select-2019?wid=470&hei=556&fmt=png-alpha&.v=1568141245782'),
    ((select id from phones where model='iPhone 11'),(select id from colors where color='Red'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone11-red-select-2019?wid=470&hei=556&fmt=png-alpha&.v=1566956144763'),
    ((select id from phones where model='iPhone 12'),(select id from colors where color='White'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-white-select-2020?wid=470&hei=556&fmt=png-alpha&.v=1604343705000'),
    ((select id from phones where model='iPhone 12'),(select id from colors where color='Black'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-black-select-2020?wid=470&hei=556&fmt=png-alpha&.v=1604343702000'),
    ((select id from phones where model='iPhone 12'),(select id from colors where color='Blue'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-blue-select-2020?wid=470&hei=556&fmt=png-alpha&.v=1604343704000'),
    ((select id from phones where model='iPhone 12'),(select id from colors where color='Green'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-green-select-2020?wid=470&hei=556&fmt=png-alpha&.v=1604343704000'),
    ((select id from phones where model='iPhone 12'),(select id from colors where color='Red'),'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-red-select-2020?wid=470&hei=556&fmt=png-alpha&.v=1604343703000'),
    ((select id from phones where model='OnePlus 9'),(select id from colors where color='Black'),'https://image01.oneplus.net/ebp/202103/12/1-m00-21-ef-rb8bwmblj_safxbbaaha2igf3z4355_840_840.png'),
    ((select id from phones where model='OnePlus 9'),(select id from colors where color='Blue'),'https://image01.oneplus.net/ebp/202103/12/1-m00-21-ef-rb8lb2blj_kaib6saajkdq34kmu331_840_840.png'),
    ((select id from phones where model='OnePlus Nord'),(select id from colors where color='Gray'),'https://image01.oneplus.net/ebp/202007/06/1-m00-15-d2-rb8lb18cw9kapfouaawjvqw4rbo469_840_840.png'),
    ((select id from phones where model='OnePlus Nord'),(select id from colors where color='Blue'),'https://image01.oneplus.net/ebp/202007/06/1-m00-15-d2-rb8bwl8cw2iaiexaaaolc0pu50g816_840_840.png'),
    ((select id from phones where model='OnePlus Nord N100'),(select id from colors where color='Black'),'https://image01.oneplus.net/ebp/202010/23/1-m00-1c-02-rb8lb1-sad6af2f0aam6ttjonqs566_840_840.png'),
    ((select id from phones where model='OnePlus 8T'),(select id from colors where color='Gray'),'https://image01.oneplus.net/ebp/202009/27/1-m00-1a-a5-rb8lb19wnp2ac5lkaah-1n-vcs4824_840_840.png'),
    ((select id from phones where model='OnePlus 8T'),(select id from colors where color='Blue'),'https://image01.oneplus.net/ebp/202009/27/1-m00-1a-a5-rb8bwl9wnqeaysdxaagf8mrumno189_840_840.png'),
    ((select id from phones where model='OnePlus 8T Pro'),(select id from colors where color='Black'),'https://image01.oneplus.net/ebp/202003/30/1-m00-12-6c-rb8bwl6bkxqanwlpaahnodotaxo639_840_840.png'),
    ((select id from phones where model='OnePlus 8T Pro'),(select id from colors where color='Green'),'https://image01.oneplus.net/ebp/202003/30/1-m00-12-6c-rb8lb16bky-azrapaag4rrgwpdm208_840_840.png'),
    ((select id from phones where model='OnePlus 8T Pro'),(select id from colors where color='Blue'),'https://image01.oneplus.net/ebp/202004/04/1-m00-12-94-rb8bwl6iowgacsw9aakosewoq8o743_840_840.png'),
    ((select id from phones where model='OnePlus 8'),(select id from colors where color='Multi color'),'https://image01.oneplus.net/ebp/202104/28/1-m00-24-92-rb8bwmciw5mabreiaaiqcqinzlu916_840_840.png'),
    ((select id from phones where model='Mi 11'),(select id from colors where color='Blue'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1612767059.44259254.png'),
    ((select id from phones where model='Mi 11'),(select id from colors where color='White'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1617687886.07262111.png'),
    ((select id from phones where model='Mi 11'),(select id from colors where color='Black'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1612767048.12913365.png'),
    ((select id from phones where model='Mi 11 Ultra'),(select id from colors where color='White'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1620283511.58026918.png'),
    ((select id from phones where model='Mi 11 Ultra'),(select id from colors where color='Black'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1620283505.37399949.png'),
    ((select id from phones where model='Mi 10T'),(select id from colors where color='Black'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1607396708.9355574.png'),
    ((select id from phones where model='Mi 10T'),(select id from colors where color='Gray'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1607396718.03768031.png'),
    ((select id from phones where model='POCO X3'),(select id from colors where color='Blue'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1598930938.44558250.png'),
    ((select id from phones where model='POCO X3'),(select id from colors where color='Gray'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1599548844.78672696.png'),
    ((select id from phones where model='Redmi 9T'),(select id from colors where color='Blue'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1612776074.79831617.png'),
    ((select id from phones where model='Redmi 9T'),(select id from colors where color='Gray'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1612776053.86092052.png'),
    ((select id from phones where model='Redmi 9T'),(select id from colors where color='Green'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1612776086.78185617.png'),
    ((select id from phones where model='Redmi 9T'),(select id from colors where color='Orange'),'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1612776064.46887888.png')


INSERT INTO phone_storage(phone_id,storage_id)
VALUES 
    ((select id from phones where model='iPhone SE'), (select id from storage where storage=64)),
    ((select id from phones where model='iPhone SE'), (select id from storage where storage=128)),
    ((select id from phones where model='iPhone SE'), (select id from storage where storage=256)),
    ((select id from phones where model='iPhone Xr'), (select id from storage where storage=64)),
    ((select id from phones where model='iPhone Xr'), (select id from storage where storage=128)),
    ((select id from phones where model='iPhone 11'), (select id from storage where storage=64)),
    ((select id from phones where model='iPhone 11'), (select id from storage where storage=128)),
    ((select id from phones where model='iPhone 11'), (select id from storage where storage=256)),
    ((select id from phones where model='iPhone 12'), (select id from storage where storage=64)),
    ((select id from phones where model='iPhone 12'), (select id from storage where storage=128)),
    ((select id from phones where model='iPhone 12'), (select id from storage where storage=256)),
    ((select id from phones where model='OnePlus 9'), (select id from storage where storage=128)),
    ((select id from phones where model='OnePlus 9'), (select id from storage where storage=256)),
    ((select id from phones where model='OnePlus Nord'), (select id from storage where storage=128)),
    ((select id from phones where model='OnePlus Nord'), (select id from storage where storage=256)),
    ((select id from phones where model='OnePlus Nord N100'), (select id from storage where storage=64)),
    ((select id from phones where model='OnePlus 8T'), (select id from storage where storage=128)),
    ((select id from phones where model='OnePlus 8T'), (select id from storage where storage=256)),
    ((select id from phones where model='OnePlus 8T Pro'), (select id from storage where storage=128)),
    ((select id from phones where model='OnePlus 8T Pro'), (select id from storage where storage=256)),
    ((select id from phones where model='OnePlus 8'), (select id from storage where storage=128)),
    ((select id from phones where model='OnePlus 8'), (select id from storage where storage=256)),
    ((select id from phones where model='Mi 11'), (select id from storage where storage=128)),
    ((select id from phones where model='Mi 11'), (select id from storage where storage=256)),
    ((select id from phones where model='Mi 11 Ultra'), (select id from storage where storage=256)),
    ((select id from phones where model='Mi 10T'), (select id from storage where storage=128)),
    ((select id from phones where model='POCO X3'), (select id from storage where storage=64)),
    ((select id from phones where model='POCO X3'), (select id from storage where storage=128)),
    ((select id from phones where model='Redmi 9T'), (select id from storage where storage=64)),
    ((select id from phones where model='Redmi 9T'), (select id from storage where storage=128))


INSERT INTO users(first_name, last_name)
VALUES 
    ("Juan", "García Cabellos"),
    ("Ana", "Ballesteros Muñoz"),
    ("Paula", "Gonzalez Román"),
    ("Oscar", "Ramirez De Maeztu");

ALTER TABLE phone_storage
ADD COLUMN price INT;

ALTER TABLE phone_storage
ADD COLUMN ram INT;

UPDATE phone_storage 
   SET price =  
   SET ram = 4
   WHERE phone_id = (select id from phone where model="iPhone SEd") AND storage_id = (select id from storage where storage=64)

UPDATE phone_storage SET price = 379 , ram = 4 WHERE phone_id = (select id from phones where model="iPhone 11") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 859 , ram = 4 WHERE phone_id = (select id from phones where model="iPhone 11") AND storage_id = (select id from storage where storage=256);
UPDATE phone_storage SET price = 689 , ram = 4 WHERE phone_id = (select id from phones where model="iPhone 11") AND storage_id = (select id from storage where storage=64);
UPDATE phone_storage SET price = 959 , ram = 4 WHERE phone_id = (select id from phones where model="iPhone 12") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 1079 , ram = 4 WHERE phone_id = (select id from phones where model="iPhone 12") AND storage_id = (select id from storage where storage=256);
UPDATE phone_storage SET price = 909 , ram = 4 WHERE phone_id = (select id from phones where model="iPhone 12") AND storage_id = (select id from storage where storage=64);
UPDATE phone_storage SET price = 659 , ram = 4 WHERE phone_id = (select id from phones where model="iPhone SE") AND storage_id = (select id from storage where storage=256);
UPDATE phone_storage SET price = 489 , ram = 4 WHERE phone_id = (select id from phones where model="iPhone SE") AND storage_id = (select id from storage where storage=64);
UPDATE phone_storage SET price = 539 , ram = 4 WHERE phone_id = (select id from phones where model="iPhone SE") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 639 , ram = 4 WHERE phone_id = (select id from phones where model="iPhone Xr") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 589 , ram = 4 WHERE phone_id = (select id from phones where model="iPhone Xr") AND storage_id = (select id from storage where storage=64);
UPDATE phone_storage SET price = 399 , ram = 6 WHERE phone_id = (select id from phones where model="Mi 10T") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 649 , ram = 8 WHERE phone_id = (select id from phones where model="Mi 11") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 699 , ram = 8 WHERE phone_id = (select id from phones where model="Mi 11") AND storage_id = (select id from storage where storage=256);
UPDATE phone_storage SET price = 1199 , ram = 12 WHERE phone_id = (select id from phones where model="Mi 11 Ultra") AND storage_id = (select id from storage where storage=256);
UPDATE phone_storage SET price = 449 , ram = 8 WHERE phone_id = (select id from phones where model="OnePlus 8") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 500 , ram = 8 WHERE phone_id = (select id from phones where model="OnePlus 8") AND storage_id = (select id from storage where storage=256);
UPDATE phone_storage SET price = 499 , ram = 8 WHERE phone_id = (select id from phones where model="OnePlus 8T") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 550 , ram = 12 WHERE phone_id = (select id from phones where model="OnePlus 8T") AND storage_id = (select id from storage where storage=256);
UPDATE phone_storage SET price = 599 , ram = 8 WHERE phone_id = (select id from phones where model="OnePlus 8T Pro") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 650 , ram = 12 WHERE phone_id = (select id from phones where model="OnePlus 8T Pro") AND storage_id = (select id from storage where storage=256);
UPDATE phone_storage SET price = 709 , ram = 8 WHERE phone_id = (select id from phones where model="OnePlus 9") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 809 , ram = 12 WHERE phone_id = (select id from phones where model="OnePlus 9") AND storage_id = (select id from storage where storage=256);
UPDATE phone_storage SET price = 369 , ram = 8 WHERE phone_id = (select id from phones where model="OnePlus Nord") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 429 , ram = 12 WHERE phone_id = (select id from phones where model="OnePlus Nord") AND storage_id = (select id from storage where storage=256);
UPDATE phone_storage SET price = 179 , ram = 4 WHERE phone_id = (select id from phones where model="OnePlus Nord N100") AND storage_id = (select id from storage where storage=64);
UPDATE phone_storage SET price = 269 , ram = 6 WHERE phone_id = (select id from phones where model="POCO X3") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 229 , ram = 4 WHERE phone_id = (select id from phones where model="POCO X3") AND storage_id = (select id from storage where storage=64);
UPDATE phone_storage SET price = 199 , ram = 4 WHERE phone_id = (select id from phones where model="Redmi 9T") AND storage_id = (select id from storage where storage=128);
UPDATE phone_storage SET price = 149 , ram = 4 WHERE phone_id = (select id from phones where model="Redmi 9T") AND storage_id = (select id from storage where storage=64);
