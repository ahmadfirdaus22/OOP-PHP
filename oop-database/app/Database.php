<?php

namespace OOP\app;

class Database{
    public static $conn; 
    protected static $username = 'root';
    protected static $password = '';
    protected static $dbname   ='new';
    protected static $hostname = 'localhost';//127.0.0.1

   public function __construct()
    {
       Database::Connection();
    } 


    public static function Connection(){
        self::$conn = new \PDO(
            "mysql:host=".self::$hostname.";dbname=".
            self::$dbname,
            self::$username,
            self::$password 
        );

        self::$conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    }

    public function Connection2(){
        self::$conn = new \PDO(
            "mysql:host=".self::$hostname.";dbname=".
            self::$dbname,
            self::$username,
            self::$password 
        );

        self::$conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    }

    public function getConnection(){
        return self::$conn; 
    }

}

// try{    
//     // $db1= Database::Connection();
//     $db2 = new Database;
//     $db2->Connection2();
//     $conn = $db2->getConnection();
//     $statement = $conn->prepare("select * from trx_header");
//     $statement->execute();
//     $terserah=$statement->fetchAll(\PDO::FETCH_OBJ);
//     print_r($terserah);

// }catch(\Throwable $th){
//     // echo $th->getmessage();
// }
