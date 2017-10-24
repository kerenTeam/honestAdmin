<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');


class Welcome extends Public_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
   public $table = "system_nav";
   public $userGroup = "user_group";
   public $member = "user_member";

	//后台首页
	public function index()
	{


		//获取用户信息
		$users = $_SESSION['users'];

		//判断是否是超级管理员
		if($users['super_admin'] == '1'){
			//获取所有权限
			$list = $this->public_model->select($this->table,'');
			$menus = subtree($list);
        	//$power = json_encode(subtree($list),JSON_UNESCAPED_UNICODE);
        			$_SESSION['power'] = json_encode($menus);

		}else{
			//获取用户组权限
			$power = $this->public_model->select_info($this->userGroup,'gid',$users['gid']);
			$menus = json_decode($power['perm'],true);
					$_SESSION['power'] = json_encode($menus);

		}
	
		$menus_data = array();
		
		foreach($menus as $key=>$value){
			if($value['status'] == '1'){
				if($value['pid'] == '0'){
					$menus_data[$value['id']]['value'] = $value;
				}else{
					$menus_data[$value['pid']]['value']['chick'][] = $value;
				}
			}
		}

		$data['menus'] = $menus_data;
		$data['page'] = '/Welcome/main';
		$this->load->view('index.html',$data);
	}

	//主页
	function main(){
		$this->load->view('main.html');		
	}


	//系统日志
	function system_log(){
		    $config['per_page'] = 10;

    		//获取页码
        	$current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        
            //var_dump($current_page);
    
                //配置
    
            $config['base_url'] = site_url('/Welcome/system_log');
    
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
            
            $total = count($this->public_model->select("h_system_log",''));
            $config['total_rows'] = $total;
        
            $this->load->library('pagination');//加载ci pagination类
            $listpage =  $this->public_model->select_page('h_system_log',$current_page,$config['per_page'],'log_time');
            $this->pagination->initialize($config);

            $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());
            // echo "<pre>";
            // var_dump($data);
            $this->load->view('system_log.html',$data);
    }


    //导入历史纪录
    function Import_Record(){



    	$this->load->view('import.html');
    }


}
