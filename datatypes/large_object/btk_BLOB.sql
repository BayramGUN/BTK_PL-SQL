-- BLOB Application (PL/SQL Application to transfer image from file system to database.)
-- D:\RandomPhotos
    -- rand_1.png
    -- rand_2.png
    -- rand_3.png
    -- rand_4.png

create table PHOTOS(
    file_name   varchar2(100) primary key,
    image blob
);

DECLARE
    photo           BFILE;
    temp_data       BLOB;
    source_offset   PLS_INTEGER := 1;
    target_offset   PLS_INTEGER := 1;
    image_file_name varchar2(100) := 'rand_4.png';
    dir_name        varchar2(15) := 'IMAGE_DIR';
BEGIN
    DBMS_LOB.createtemporary(temp_data, true);
    photo := BFilename(dir_name, image_file_name);
    DBMS_LOB.FileOpen(photo, DBMS_LOB.FILE_READONLY);
    DBMS_LOB.LoadFromFile(temp_data, photo, DBMS_LOB.LOBMAXSIZE, target_offset, source_offset);
    INSERT INTO PHOTOS(file_name, image) 
    VALUES ( image_file_name, temp_data );
    DBMS_LOB.FileClose( photo );
END;

SELECT * FROM HR.PHOTOS;
