<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');
// 客户挂历
class Customer extends Public_Controller
{

    public $customer = 'customer';
    function __construct() {
        parent::__construct();
    }

    //
    function index(){
        $config['per_page'] = 10;
        
        //获取页码

        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/

        //var_dump($current_page);

            //配置
        $config['base_url'] = site_url('/Welcome/user_list');

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
        
        $total = count($this->public_model->select($this->customer,''));
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_page($this->customer,$current_page,$config['per_page'],'');
        $this->pagination->initialize($config);

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());

        $this->load->view('customer/companySet.html',$data);
    }


    //新增客户管理
    function add_customer(){
         //判断是是否具有权限
        
        if($_POST){ 
            $q = $this->uri->uri_string();
            $ret =  if_user_power($q,$_SESSION['power']);
            if($ret == '0'){
               echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.history.go(-1);</script>";
               exit;
           }
            $data = $this->input->post();
            if($this->public_model->insert($this->customer,$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增客户成功,客户名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Customer/index')."'</script>";  
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增客户失败,客户名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Customer/index')."'</script>";  
            }
        }else{
            
            $this->load->view('customer/newCompany.html');
        }
        
    }

    //编辑客户管理
    

}