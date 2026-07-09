-- Creating Logs table
CREATE TABLE logs (
    log_id SERIAL PRIMARY KEY,
    table_name TEXT NOT NULL,
    action TEXT NOT NULL,
    user_id INTEGER,
    log_message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);





-- Function for INSERT logging
CREATE OR REPLACE FUNCTION log_student_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO logs (table_name, action, user_id, log_message)
    VALUES ('students', 'INSERT', NEW.student_id, 'User created: ' || NEW.name);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger for INSERT
CREATE TRIGGER student_insert_log
AFTER INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION log_student_insert();







-- Function for DELETE warning
CREATE OR REPLACE FUNCTION log_student_delete()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO logs (table_name, action, user_id, log_message)
    VALUES ('students', 'DELETE', OLD.student_id, 'WARNING: All data for user ' || OLD.name || ' (ID: ' || OLD.student_id || ') is lost');
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- Create trigger for DELETE
CREATE TRIGGER student_delete_log
AFTER DELETE ON students
FOR EACH ROW
EXECUTE FUNCTION log_student_delete();





-- TESTING QUERIES
-- Test insert
INSERT INTO students VALUES (56400248, 'John Doe', 'CS', 3.5);

DELETE FROM students WHERE student_id = 56400248;

SELECT * FROM logs ORDER BY created_at DESC;

-- RESULT:

