<?php
namespace OOP\app;

class TrxHeaders extends Database{

    public function all()
    {
        $statement = self::$conn->prepare("select * from trx_header");
        $statement->execute();

        return $statement->fetchAll(\PDO::FETCH_OBJ);//hasil berupa object
    }

    public function find($id){
        $statement = self::$conn->prepare("select * from trx_header where id =$id");
        $statement->execute();

        return $statement->fetch(\PDO::FETCH_OBJ);//hasil berupa object
    }
    
    // public function showtrx(){
    //     $statement = self::$conn
    // }
    
    public function findArray($id){
        $statement = self::$conn->prepare("select * from trx_header where id =$id");
        $statement->execute();

        return $statement->fetch();//hasil berupa array
    }

    public function insert($data){
        $statement = self::$conn->prepare("INSERT INTO trx_header(id_infos,trx_time, total_discount,total_price, total_payment, total_change, created_at) VALUES(:id_infos, :trx_time, :total_discount, :total_price, :total_payment, :total_change, :created_at)");

        return $statement->execute($data);
        
    }

    public function update($data, $id){
        $statement = self::$conn->prepare("UPDATE trx_header SET id_infos= :id_infos, total_discount =:total_discount, total_price= :total_price, total_payment= :total_payment, total_change= :total_change, updated_at= :updated_at where id = $id");

        return $statement->execute($data);
    }

    public function delete($id){
        $statement = self::$conn->prepare("DELETE FROM trx_header WHERE id= $id");

        return $statement->execute();
    }
}

// try{
//     $trxHeader = new TrxHeaders();
//     // print_r($trxHeader->index());
//     // print_r($trxHeader->find(1));
//     // $data= $trxHeader->find(1);
//     // echo $data->trx_time;
//     // $data2 =$trxHeader->findArray(1);
//     // echo $data2['trx_time'];
//     // var_dump((object) $data2);
//     // $insert = [
//     //     'id_infos' => 1,
//     //     'trx_time' => date('Y-m-d H:i:s'),
//     //     'total_discount' => 0,
//     //     'total_price' => 20000,
//     //     'total_payment' => 25000,
//     //     'total_change' => 5000,
//     //     'created_at' =>  date('Y-m-d H:i:s')
//     // ];
//     // $trxHeader->insert($insert);
//     $update = [
//         'id_infos' => 3,
//         'total_discount' => 1000,
//         'total_price' => 25000,
//         'total_payment' => 35000,
//         'total_change' => 11000,
//         'updated_at' =>  date('Y-m-d H:i:s')
//     ];
//     $id = 3;
    
//     if($trxHeader->update($update,$id)== true){
//         echo "<script>alert('Success')</script>"; 
//     }
//     // $trxHeader->delete(5);

// }catch(\Throwable $th){
//     throw $th;
// }
