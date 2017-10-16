<?php

/* 用户中心*/
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');


class UserCenter extends Public_Controller {

    public $task = "project_task";
    public $member = "user_member";
    public $task_user = "project_task_group";

    function __construct() {
        parent::__construct();
    }



    //个人信息
    function userinfo(){

        $data['user'] = $this->public_model->select_info($this->member,'user_id',$_SESSION['users']['user_id']);
    
    	$this->load->view('userCenter/userCenter.html',$data);
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

    //个人任务
    function task(){
        //获取个人任务
        $data['task'] = $this->public_model->ret_userTask($_SESSION['users']['user_id']);
     
        //获取个人信息

        $this->load->view('userCenter/userTask.html',$data);

    }

    //查看任务详情
    function task_info(){
        $id = intval($this->uri->segment('3'));
        if($id == '0'){
            $this->load->view('404.html');
        }else{
            //获取任务详情
            $data['task'] = $this->public_model->select_info($this->task,'id',$id);
            //var_dump($task);
            //获取公司职员
            $data['user'] = $this->public_model->select('h_user_member','');
            //获取任务类型
            $data['tash_type'] = $this->public_model->select_where('h_project_task_type','taskId',$id,'');
            //获取任务纪录
            //$data['record'] = $this->public_model->select_where('h_project_task_record','task_id',$id,'create_time');
            //获取留言
            $data['message'] = $this->public_model->select_where('h_project_task_message','task_id',$id,'create_time');
            $data['id'] = $id;

            $this->load->view('userCenter/task_info.html',$data);
        }
    }




}