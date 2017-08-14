<?php

/* 用户组   与  用户权限 */
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');


class Member extends Public_Controller {


    public $table = "system_nav";
    public $member = "user_member";
    
    function __construct() {
        parent::__construct();
    }

    //权限管理
    function power(){
        $list = $this->public_model->select($this->table,'');

        $data['list'] = subtree($list);
        $this->load->view('adminOrUser/PrivilegeSet.html',$data);
    }

    //新增权限
    function add_power(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->insert($this->table,$data)){
                //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增权限成功,权限名称为".$data['name'],
                );
                add_system_log($arr);
                
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/power')."'</script>";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增权限失败,权限名称为".$data['name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Member/power')."'</script>";
            }
        }else{
            $this->load->view('404.html');
        }
    }
    //新增子权限
    function add_power_level(){
        
        if($_POST){
             $data = $this->input->post();
            if($this->public_model->insert($this->table,$data)){
                //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增权限成功,权限名称为".$data['name'],
                );
                add_system_log($arr);
                echo "1";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增权限失败,权限名称为".$data['name'],
                );
                add_system_log($arr);
                echo "2";
            }
        }else{
            echo "2";
        }
    }

    //编辑权限
    function edit_power(){
           
        if($_POST){
             $data = $this->input->post();
            if($this->public_model->updata($this->table,'id',$data['id'],$data)){
                //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"编辑权限成功,权限名称为".$data['name'],
                );
                add_system_log($arr);
                echo "1";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"编辑权限失败,权限名称为".$data['name'],
                );
                add_system_log($arr);
                echo "2";
            }
        }else{
            echo "2";
        }
    }


    //删除权限
    function del_power(){
        if($_POST){
              $data = $this->input->post();
               if($this->public_model->delete($this->table,'id',$data['id'])){
                //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除权限成功",
                );
                add_system_log($arr);
                echo "1";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"编辑权限失败",
                );
                add_system_log($arr);
                echo "2";
            }
        }else{
            echo "2";
        }
    }


    //用户组
    function userGroup(){
        $config['per_page'] = 10;

		//获取页码

		$current_page=intval($this->uri->segment(3));//index.php 后数第4个/

		//var_dump($current_page);

			//配置

		$config['base_url'] = site_url('/Member/userGroup');

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

		$config['next_link']= '»';

		$config['prev_link']= '«';

		$config['last_link']= '末页';
		$config['num_links'] = 4;
    	
		$total = count($this->public_model->select($this->member,''));
   		$config['total_rows'] = $total;
 
		$this->load->library('pagination');//加载ci pagination类
		$listpage =  $this->public_model->select_page('jy_admin_user',$current_page,$config['per_page'],'');
		$this->pagination->initialize($config);

		$data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());

        $this->load->view('adminOrUser/userGroupSet.html',$data);
    }

}


?>