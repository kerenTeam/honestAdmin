<?php

/* 用户中心*/
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');


class UserCenter extends Public_Controller {

    public $task = "project_task";
    public $member = "user_member";

    function __construct() {
        parent::__construct();
    }



    //个人信息
    function userinfo(){

        

          $data['user'] = $this->public_model->select_info($this->member,'user_id',$_SESSION['users']['user_id']);
    
    	$this->load->view('userCenter/userCenter.html',$data);
    }

    //个人任务
    function task(){
        //获取个人任务
        //$data['task'] = $this->public_model->select_where('');
        //获取个人信息

        $this->load->view('userCenter/userCenter.html');

    }

    //个人信息修啊哥i
    function edit_user_info(){
        if($_POST){
            $data = $this->input->post();

            if(!empty($_FILES['img']['name'])){
                $config['upload_path']      = 'upload/avater/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg|webp';
                $config['max_size']     = 2048;
                $config['file_name'] = date('Y-m-d_His');

                $this->load->library('upload', $config);

                // 上
                if(!$this->upload->do_upload('img')) {

                    echo "<script>alert('图片上传失败！');window.location.href='".site_url('/UserCenter/userinfo')."'</script>";exit;
                }else{
                    $data['avatar'] = 'upload/avater/'.$this->upload->data('file_name');
                }
            }
            if(!empty($data['pass'])){
                $data['password'] = md5($data['pass']);
            }
            unset($data['pass'],$data['img']);
         
        

            if($this->public_model->updata($this->member,'user_id',$data['user_id'],$data)){
                // echo "12";
              echo "<script>alert('操作成功！');window.parent.location.reload();</script>";
            }else{
              echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
            }
        }else{
            $this->load->view('404.html');
        }
    }



}