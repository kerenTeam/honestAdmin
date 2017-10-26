<?php

/* 用户中心*/
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');


class UserCenter extends Public_Controller {

    public $task = "project_task";
    public $member = "user_member";
    public $task_user = "project_group";

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
        $data['lists'] = $this->public_model->ret_userTask($_SESSION['users']['user_id']);
        
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
            $data['project'] = $this->public_model->select_info($this->project,'id',$id);
            //var_dump($task);
            //获取公司职员
            $data['user'] = $this->public_model->select('h_user_member','');
            
            //获取留言
            $data['message'] = $this->public_model->select_where_many_sort('h_project_message','project_id',$id,'to_user_id','0','create_time');
            $data['id'] = $id;

            $this->load->view('userCenter/task_info.html',$data);
        }
    }

    //新增留言
    function add_message(){
        if($_POST){
            $data = $this->input->post();
            $data['user_id'] = $_SESSION['users']['user_id'];
            $data['create_time'] = date('Y-m-d H:i:s');


            if($data['toid'] == 'undefined'){
                unset($data['toid']);
            }else{
                unset($data['type']);
                //根据留言返回数据
                $mass = $this->public_model->select_info('h_project_message','m_id',$data['toid']);

               $data['type'] = $mass['type'];
               $data['to_user_id'] = $data['toid'];
               unset($data['toid']);
            }

            //上传
            if(!empty($_FILES['file']['name'])){
                $config['upload_path']      = 'upload/file/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg|xls|xlsx|doc|docx|text';
                $config['max_size']     = 5120;
                $config['file_name'] = date('y-m-d').'-'.$_FILES['file']['name'];

                $this->load->library('upload', $config);

                // 上传

                if(!$this->upload->do_upload('file')) {

                    echo "<script>alert('文件上传失败！');window.parent.location.reload();</script>";exit;
                }else{
                    $data['file_path'] = 'upload/file/'.$this->upload->data('file_name');
                }
            }


            if($this->public_model->insert('h_project_message',$data)){
              $arr = array(
                  'log_url'=>$this->uri->uri_string(),
                  'user_id'=>$_SESSION['users']['user_id'],
                  'username'=>$_SESSION['users']['username'],
                  'log_ip'=>get_client_ip(),
                  'log_status'=>'1',
                  'log_message'=>"新增留言成功,项目id为".$data['project_id'],
              );
              add_system_log($arr);
              echo "1";

            }else{
              $arr = array(
                  'log_url'=>$this->uri->uri_string(),
                  'user_id'=>$_SESSION['users']['user_id'],
                  'username'=>$_SESSION['users']['username'],
                  'log_ip'=>get_client_ip(),
                  'log_status'=>'0',
                  'log_message'=>"新增留言失败,项目id为".$data['project_id'],
              );
              add_system_log($arr);
              echo "2";

            }
        }else{
            echo "404";
        }
    }

    //搜索个人任务
    function searchUserProject(){
            $config['per_page'] = 10;
            //获取页码
            $current_page=intval($this->input->get("size"));//index.php 后数第4个/

            $state = $this->input->get('state');
            $sear = $this->input->get('sear');
            //分页配置
            $config['full_tag_open'] = '<ul class="am-pagination tpl-pagination">';

            $config['full_tag_close'] = '</ul>';

            $config['first_tag_open'] = '<li>';

            $config['first_tag_close'] = '</li>';

            $config['prev_tag_open'] = '<li>';

            $config['prev_tag_close'] = '</li>';

            $config['next_tag_open'] = '<li>';

            $config['next_tag_close'] = '</li>';

            $config['cur_tag_open'] = '<li class="am-active"><a>';

            $config['cur_tag_close'] = '</a></li>';

            $config['last_tag_open'] = '<li>';

            $config['last_tag_close'] = '</li>';

            $config['num_tag_open'] = '<li>';

            $config['num_tag_close'] = '</li>';
            $config['first_link']= '首页';

            $config['next_link']= '下一页';

            $config['prev_link']= '上一页';

            $config['last_link']= '末页';

            $list = search_project_page();
           

            $config['total_rows'] = count($list);

            $config['page_query_string'] = TRUE;//关键配置
            // $config['reuse_query_string'] = FALSE;
            $config['query_string_segment'] = 'size';
            $config['base_url'] = site_url('/UserCenter/searchUserProject?').'sear='.$sear;

            // //分页数据\
            $listpage = search_project_page($sear,$config['per_page'],$current_page);
            $this->load->library('pagination');//加载ci pagination类

            $this->pagination->initialize($config);

            $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());

            $this->load->view('UserCenter/userTask.html',$data);
    }


}