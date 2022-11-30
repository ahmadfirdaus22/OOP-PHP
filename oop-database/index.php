<?php

require_once __DIR__ . '/vendor/autoload.php';

// namespace OOP\app;

use OOP\app\TrxHeaderController;

$controller = new TrxHeaderController;

switch(@$_GET['page']){
    case 'show':
        $controller->search($_GET['id']);
        break;
    case 'insert':
        $controller->insert($_GET['']);
        break;
    default:
        $controller->show();
        break;
}