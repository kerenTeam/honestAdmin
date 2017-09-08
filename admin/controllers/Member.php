<?php

/* 用户组   与  用户权限 */
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');


class Member extends Public_Controller {


    public $table = "system_nav";
    public $member = "user_member";
    public $userGroup = "user_group";
    public $user_link = "user_contacts";//用户联系人
    public $user_compact = "user_compact";//劳动合同
   public $user_education = "user_education";//学历
   public $user_qualifications = "user_qualifications";//职卫
   public $user_regsecurity = "user_regsecurity";//注安
   public $user_safetyevaluation = "user_safetyevaluation";//安评
   public $user_expert = "user_expert";//专家
    
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

                        echo "<script>alert('图片上传失败！');window.location.href='".site_url('/Member/userGroup')."'</script>";exit;
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
        //返回所有用户组
        $userGroup = $this->public_model->select($this->userGroup,'');

        //返回所有用户信息
        // var_dumP($userGroup);
        $config['per_page'] = 10;
        
        //获取页码

        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/

        //var_dump($current_page);

            //配置

        $config['base_url'] = site_url('/Member/user_List');

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
        $listpage =  $this->public_model->select_page($this->member,$current_page,$config['per_page'],'addtime');
        $this->pagination->initialize($config);

        $data = array('lists'=>$listpage,'userGroup'=>$userGroup,'pages' => $this->pagination->create_links());

  

        $this->load->view('adminOrUser/usersList.html',$data);
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

                    echo "<script>alert('图片上传失败！');window.location.href='".site_url('/Member/user_List')."'</script>";exit;
                }else{
                    $data['avatar'] = 'upload/avater/'.$this->upload->data('file_name');
                }
            }
            
            $data['password'] = md5('123456');
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
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增用户失败,用户名称为".$data['username'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Member/user_List')."'</script>";
            }
        }else{
            //获取所有用户组
            $data['group'] = $this->public_model->select($this->userGroup,'');
            $this->load->view('adminOrUser/userInfomation/info.html',$data);
        }
    }

    //用户个人信息修改
    function edit_user(){
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

                    echo "<script>alert('图片上传失败！');window.location.href='".site_url('/Member/user_List')."'</script>";exit;
                }else{
                    $data['avatar'] = 'upload/avater/'.$this->upload->data('file_name');
                }
            }
            if($this->public_model->updata($this->member,$data)){
                //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"编辑用户成功,用户名称为".$data['username'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
            }else{
                  //日志
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"编辑用户失败,用户名称为".$data['username'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Member/user_List')."'</script>";
            }
        }else{
            $id = intval($this->uri->segment('3'));
            //获取所有用户组
            $data['group'] = $this->public_model->select($this->userGroup,'');
            $data['users'] = $this->public_model->select_info($this->member,'user_id',$id);
            $this->load->view('adminOrUser/userInfomation/userinfo.html',$data);
        }
    }

    //通讯录
    function user_communication(){
        if($_POST){
            $data = $this->input->post();
            if($data['type'] == 'insert'){
                unset($data['type']);
                if($this->public_model->insert($this->user_link,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增用户联系人成功,用户名称为".$data['username'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"新增用户联系人失败,用户名称为".$data['username'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }else{
                unset($data['type']);
                if($this->public_model->updata($this->user_link,'user_id',$data['user_id'],$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"修改用户联系人成功,用户名称为".$data['username'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"修改用户联系人失败,用户名称为".$data['username'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }

        }else{
            $userid = intval($this->uri->segment(3));
            //获取用户联系方式
            $data['users'] = $this->public_model->select_info($this->user_link,'user_id',$userid);
            $data['userid'] = $userid;
            $this->load->view('adminOrUser/userInfomation/correspondence.html',$data);
        }
    }

    //劳动合同
    function user_laborContract(){
        if($_POST){
            $data = $this->input->post();
            if($data['type'] == 'insert'){
                unset($data['type']);
                if($this->public_model->insert($this->user_compact,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增用户合同成功,用户名称为".$data['username'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"新增用户合同失败,用户名称为".$data['username'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }else{
                unset($data['type']);
                if($this->public_model->updata($this->user_compact,'user_id',$data['user_id'],$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"修改用户合同成功,用户名称为".$data['username'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"修改用户合同失败,用户名称为".$data['username'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }
        }else{
            $userid = intval($this->uri->segment(3));
            //获取用户联系方式
            $data['users'] = $this->public_model->select_info($this->user_compact,'user_id',$userid);
            $data['userid'] = $userid;
            $this->load->view('adminOrUser/userInfomation/laborContract.html',$data);
        }
    }


    //学历信息
    function education(){
        if($_POST){
            $data = $this->input->post();
            if($data['type'] == 'insert'){
                unset($data['type']);
                if($this->public_model->insert($this->user_education,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增用户学历成功,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"新增用户学历失败,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }else{
                unset($data['type']);
                if($this->public_model->updata($this->user_education,'user_id',$data['user_id'],$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"编辑用户学历成功,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"编辑用户学历失败,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }
        } else{
            $userid = intval($this->uri->segment(3));
            //获取用户联系方式
            $data['users'] = $this->public_model->select_info($this->user_education,'user_id',$userid);
            $data['userid'] = $userid;
            $this->load->view('adminOrUser/userInfomation/education.html',$data);
        }     
    }    

    //职业卫生
    function occupational(){
        if($_POST){
            $data = $this->input->post();
            if($data['type'] == 'insert'){
                unset($data['type']);
                if($this->public_model->insert($this->user_qualifications,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增用户职卫信息成功,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"新增用户职卫信息失败,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }else{
                unset($data['type']);
                if($this->public_model->updata($this->user_qualifications,'user_id',$data['user_id'],$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"编辑用户职卫信息成功,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"编辑用户职卫信息失败,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }
        } else{
            $userid = intval($this->uri->segment(3));
            //获取用户联系方式
            $data['users'] = $this->public_model->select_info($this->user_qualifications,'user_id',$userid);
            $data['userid'] = $userid;
            $this->load->view('adminOrUser/userInfomation/zhiwei.html',$data);
        }  
    }

    //注册安全
    function security(){
        if($_POST){
            $data = $this->input->post();
            if($data['type'] == 'insert'){
                unset($data['type']);
                if($this->public_model->insert($this->user_regsecurity,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增职员注安师证书成功,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"新增职员注安师证书失败,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }else{
                unset($data['type']);
                if($this->public_model->updata($this->user_regsecurity,'user_id',$data['user_id'],$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"编辑职员注安师证书成功,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"编辑职员注安师证书失败,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }
        } else{
            $userid = intval($this->uri->segment(3));
            //获取用户联系方式
            $data['users'] = $this->public_model->select_info($this->user_regsecurity,'user_id',$userid);
            $data['userid'] = $userid;
            $this->load->view('adminOrUser/userInfomation/zhuan.html',$data);
        }  
    }

    //安全评价
    function evaluate(){
        if($_POST){
            $data = $this->input->post();
            if($data['type'] == 'insert'){
                unset($data['type']);
                if($this->public_model->insert($this->user_safetyevaluation,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增用户学历成功,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"新增用户学历失败,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }else{
                unset($data['type']);
                if($this->public_model->updata($this->user_safetyevaluation,'user_id',$data['user_id'],$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"编辑用户学历成功,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"编辑用户学历失败,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }
        } else{
            $userid = intval($this->uri->segment(3));
            //获取用户联系方式
            $data['users'] = $this->public_model->select_info($this->user_safetyevaluation,'user_id',$userid);
            $data['userid'] = $userid;
            $this->load->view('adminOrUser/userInfomation/anpin.html',$data);
        }  
    }

    //专家
    function expert(){
        if($_POST){
            $data = $this->input->post();
            if($data['type'] == 'insert'){
                unset($data['type']);
                if($this->public_model->insert($this->user_expert,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增专家信息成功,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"新增专家信息失败,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }else{
                unset($data['type']);
                if($this->public_model->updata($this->user_expert,'user_id',$data['user_id'],$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"编辑专家信息成功,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
    
                }else{
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"编辑专家信息失败,用户id为".$data['user_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.location.href='".site_url('/Member/user_List')."'</script>";
                }
            }
        } else{
            $userid = intval($this->uri->segment(3));
            //获取用户联系方式
            $data['users'] = $this->public_model->select_info($this->user_expert,'user_id',$userid);
            $data['userid'] = $userid;
            $this->load->view('adminOrUser/userInfomation/expert.html',$data);
        }  
    }

    //用户过审

    //删除用户
    function del_user_member(){
        if($_POST){
            $id = $this->input->post('id');
            //var_dump($id);
            //删除用户
            if($this->public_model->delete($this->member,'user_id',$id)){
                //删除其他信息
                $this->public_model->delete($this->user_contacts,'user_id',$id);
                $this->public_model->delete($this->user_compact,'user_id',$id);
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除用户成功,用户id为".$id,
                );
                add_system_log($arr);
                echo "1";exit;

            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"删除用户失败,用户id为".$id,
                );
                add_system_log($arr);
                echo "2";exit;
            }
        }
    }



    //导入用户信息
    function import_userList(){
        $name = date('Y-m-d');
        $inputFileName = "upload/xls/" .$name .'.xls';
        move_uploaded_file($_FILES["pics"]["tmp_name"],$inputFileName);
        //引入类库
        $this->load->library('excel');
        if(!file_exists($inputFileName)){

                echo "<script>alert('文件导入失败!');window.location.href='".site_url('/Contract/index')."'</script>";

                exit;

        }
        //导入excel文件类型 excel2007 or excel5
        
        $PHPReader = new PHPExcel_Reader_Excel2007();
        
        if(!$PHPReader->canRead($inputFileName)){
            $PHPReader = new PHPExcel_Reader_Excel5();
            if(!$PHPReader->canRead($inputFileName)){
                echo 'no Excel';
            return;
            }
        }   
        $yes = array();
        $error = array();
                      
        
        $PHPExcel = $PHPReader->load($inputFileName);

        $currentSheet = $PHPExcel->getSheet(0);  //读取excel文件中的第一个工作表

        $allColumn = $currentSheet->getHighestColumn(); //取得最大的列号

        $allRow = $currentSheet->getHighestRow(); //取得一共有多少行


     
        for($currentRow = 2;$currentRow <= $allRow;$currentRow++){

            $data['username'] = $PHPExcel->getActiveSheet()->getCell("A".$currentRow)->getValue();//获取c列的值
            //合同号
            $data['employee_num'] = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取c列的值
            

            $data['incumbency'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();//获取d列的值

            $part = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();//获取d列的值
            if($part == '专职'){
                $data['part'] = '1';
            }else{
                $data['part'] = '0';
            }

            $data['id_card'] = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();//获取d列的值

            $data['birth_date'] = $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();//获取d列的值

            $data['qq'] = $PHPExcel->getActiveSheet()->getCell("G".$currentRow)->getValue();//获取d列的值

            $data['email'] = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();//获取d列的值

            $data['education'] = $PHPExcel->getActiveSheet()->getCell("I".$currentRow)->getValue();//获取d列的值

            $data['entry_time'] = $PHPExcel->getActiveSheet()->getCell("J".$currentRow)->getValue();//获取d列的值
            
            $data['employment'] = $PHPExcel->getActiveSheet()->getCell("K".$currentRow)->getValue();//获取d列的值
            $data['social_security'] = $PHPExcel->getActiveSheet()->getCell("L".$currentRow)->getValue();//获取d列的值
            
            $social_state = $PHPExcel->getActiveSheet()->getCell("M".$currentRow)->getValue();//获取d列的值
            if($social_state == "是"){
                $data['social_state'] = '1';
            }else{
                $data['social_state'] = '0';
            }
            $data['remarks'] = $PHPExcel->getActiveSheet()->getCell("N".$currentRow)->getValue();//获取d列的值
            if($data['username'] == NULL){

                //删除临时文件
                @unlink($inputFileName);
                exit;

            } 
        
            $data['gid'] = '2';
            //新增合同
            if($this->public_model->insert($this->member,$data)){
                $yes[] = $currentRow;
            }else{
                $error[] = $currentRow;
            }
        }

        $ret = array('yes'=>count($yes),'error'=>count($error),'yeslist'=>$yes,'errorlist'=>$error);
        
        //            //日志
        
        $arr = array(
            'log_url'=>$this->uri->uri_string(),
            'user_id'=>$_SESSION['users']['user_id'],
            'username'=>$_SESSION['users']['username'],
            'log_ip'=>get_client_ip(),
            'log_status'=>'1',
            'log_message'=>"导入了职员信息，导入成功".$ret['yes']."条，失败".$ret['error']."条，失败条目：".implode(',',$ret['errorlist']),
        );
        add_system_log($arr);   
        echo $arr['log_message'];
    }



}


?>