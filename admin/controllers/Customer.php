<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// 客户挂历
class Customer extends Public_Controller
{


    function __construct() {
        parent::__construct();
    }

    //
    function index(){

        $this->load->view('');
    }


}