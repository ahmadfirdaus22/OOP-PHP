<?php

namespace OOP\app;

class TrxHeaderController{
    public $headers;

    public function __construct(){
        $this->headers = new TrxHeaders();
    }

    public function show(){
        print_r($this->headers->all());
    }

    public function search($id){
        print_r($this->headers->find($id));
    }

    public function searcharray($id){
        print_r($this->headers->findArray($id));
    }

    public function insert($data){
        $data = [
            'id_infos' => 1,
            'trx_time' => date('Y-m-d H:i:s'),
            'total_discount' => 0,
            'total_price' => 20000,
            'total_payment' => 25000,
            'total_change' => 5000,
            'created_at' =>  date('Y-m-d H:i:s')
        ];
        
        print_r($this->headers->insert($data));
    }

    public function update($update,$id){
        $update = [
            'id_infos' => 3,
            'total_discount' => 1000,
            'total_price' => 25000,
            'total_payment' => 35000,
            'total_change' => 11000,
            'updated_at' =>  date('Y-m-d H:i:s')
        ];

        print_r($this->headers->update($update,$id));
    }

    public function delete($id){
        print_r($this->headers->delete($id));
    }
}

