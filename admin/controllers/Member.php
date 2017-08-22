<?php

/* 用户组   与  用户权限 */
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');


class Member extends Public_Controller {


    public $table = "system_nav";
    public $member = "user_member";
    public $userGroup = "user_group";
    
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
    	
		$total = count($this->public_model->select($this->userGroup,''));
   		$config['total_rows'] = $total;
 
		$this->load->library('pagination');//加载ci pagination类
		$listpage =  $this->public_model->select_page($this->userGroup,$current_page,$config['per_page'],'addtime');
		$this->pagination->initialize($config);

		$data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());

        $this->load->view('adminOrUser/userGroupSet.html',$data);
    }

    //新增权限组
    function add_userGroup(){
        if($_POST){
            $data = $this->input->post();
            if(!empty($_FILES['img']['name'])){
                    $config['upload_path']      = 'upload/icon/';
                    $config['allowed_types']    = 'gif|jpg|png|jpeg|webp';
                    $config['max_size']     = 2048;
                    $config['file_name'] = date('Y-m-d_His');

                    $this->load->library('upload', $config);

                    // 上传

                    if(!$this->upload->do_upload('img')) {

                        echo "<script>alert('图片上传失败！');window.location.href='".site_url('Member/userGroup')."'</script>";exit;
                    }else{
                        $data['icon'] = 'upload/icon/'.$this->upload->data('file_name');
                    }
            }
            if($this->public_model->insert($this->userGroup,$data)){
                //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增用户组成功,用户组名称为".$data['group_name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/userGroup')."'</script>";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增用户组失败,用户组名称为".$data['group_name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Member/userGroup')."'</script>";
            }
        }else{
            $this->load->view('404.html');
        }
    }

    //  编辑用户组
    function edit_userGroup(){
    
        if($_POST){
            $data = $this->input->post();
            if(!empty($_FILES['img']['name'])){
                    $config['upload_path']      = 'upload/icon/';
                    $config['allowed_types']    = 'gif|jpg|png|jpeg|webp';
                    $config['max_size']     = 2048;
                    $config['file_name'] = date('Y-m-d_His');

                    $this->load->library('upload', $config);

                    // 上传

                    if(!$this->upload->do_upload('img')) {

                        echo "<script>alert('图片上传失败！');window.location.href='".site_url('/Member/userGroup')."'</script>";exit;
                    }else{
                        $data['icon'] = 'upload/icon/'.$this->upload->data('file_name');
                    }
            }
            if($this->public_model->updata($this->userGroup,'gid',$data['gid'],$data)){
                //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"修改用户组成功,用户组名称为".$data['group_name'],
                );
                add_system_log($arr);
                
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/userGroup')."'</script>";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"修改用户组失败,用户组名称为".$data['group_name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Member/userGroup')."'</script>";
            }
        }else{
           $this->load->view('404.html');
        }
    }

    //设置权限
    function edit_group_power(){
        $id = intval($this->uri->segment(3));
     
        $data['id'] = $id;
        //获取所有权限
        $list = $this->public_model->select($this->table,'');
        
        $user_group = $this->public_model->select_info($this->userGroup,'gid',$id);
        $pw = json_decode($user_group['perm'],true);

        $a = subtree($list,$pw);

        $data['list'] = $a;
        $this->load->view('adminOrUser/PrivilegeList.html',$data);
    }

    //设置权限
    function group_power(){
        if($_POST){
            $data = $this->input->post();

            $power = explode(',',$data['perm']);
            $arr = array();
            //获取权限详情
            foreach($power as $v){
                $arr[] = $this->public_model->select_info($this->table,'id',$v);
            }
            $updata['perm'] = json_encode($arr,JSON_UNESCAPED_UNICODE);
            if($this->public_model->updata($this->userGroup,'gid',$data['gid'],$updata)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"修改用户组权限成功,用户组名称id为".$data['gid'],
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
                    'log_message'=>"修改用户组权限失败,用户组名称id为".$data['gid'],
                );
                add_system_log($arr);
                echo "2";
            }
        }else{
            echo "2";
        }

    }

    //删除分组
    function del_userGroup(){
        if($_POST){
            $id = $this->input->post('id');
            if($id == '1'){
                echo "3";
                exit;
            }
            if($this->public_model->delete($this->userGroup,'gid',$id)){
                 $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除用户组成功,用户组id为".$id,
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
                    'log_message'=>"删除用户组失败,用户组id为".$id,
                );
                add_system_log($arr);
                echo "2";
            }
        }else{
            echo "2";
        }
    }

    //用户列表
    function user_List(){


        $this->load->view('adminOrUser/usersList.html');
    }

    //新增用户
    function add_user(){
        if($_POST){
            $data = $this->input->post();
            if(!empty($_FILES['img']['name'])){
                $config['upload_path']      = 'upload/avater/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg|webp';
                $config['max_size']     = 2048;
                $config['file_name'] = date('Y-m-d_His');

                $this->load->library('upload', $config);

                // 上传

                if(!$this->upload->do_upload('img')) {

                    echo "<script>alert('图片上传失败！');window.location.href='".site_url('Member/user_List')."'</script>";exit;
                }else{
                    $data['avatar'] = 'upload/avater/'.$this->upload->data('file_name');
                }
            }
            if($this->public_model->insert($this->member,$data)){
                //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增用户成功,用户名称为".$data['username'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/userGroup')."'</script>";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增用户组失败,用户组名称为".$data['group_name'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Member/userGroup')."'</script>";
            }






        }else{
            //获取所有用户组
            $data['group'] = $this->public_model->select($this->userGroup,'');
            $this->load->view('adminOrUser/userInfomation/info.html',$data);
        }
    }

}


?>