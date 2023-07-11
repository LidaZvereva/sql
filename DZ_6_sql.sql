-- Задача 1
DELIMITER //
CREATE PROCEDURE convert_seconds(seconds INT)
BEGIN
	DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    
    SET days = seconds / 86400;
    SET seconds = seconds % 86400;
    
    SET hours = seconds / 3600;
    SET seconds = seconds % 3600;
    
    SET minutes = seconds / 60;
    SET seconds = seconds % 60;
    
    SELECT CONCAT(days, 'дней, ', hours, 'часов, ', minutes, 'минут, ', seconds, 'секунд, ');
END //
DELIMITER ;

-- Задача 2
SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER //
CREATE FUNCTION even_numbers()
RETURNS VARCHAR(100)
BEGIN
    DECLARE result VARCHAR(100) DEFAULT '';
    DECLARE i INT DEFAULT 2;
    
    WHILE i <= 10 DO
        IF i % 2 = 0 THEN
            SET result = CONCAT(result, i, ' ');
        END IF;
        SET i = i + 2;
    END WHILE;
    
    RETURN result;
END //
DELIMITER ;