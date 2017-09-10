<?php

/* 用户中心*/
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');


class UserCenter extends Public_Controller {

    function __construct() {
        parent::__construct();
    }



    //个人信息
    function userinfo(){

    	$this->load->view('userCenter/');
    }

    //个人任务
    function task(){

    }





}