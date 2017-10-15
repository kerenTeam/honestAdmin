<?php

/* 财务管理 */
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');


class Finance extends Public_Controller {

    public $contract = "contract";//合同表

    public $contract_account = "contract_account";//收支表

    public $member = "user_member";


    function __construct() {
        parent::__construct();
    }


    //合同
    function contract(){
        //获取完成的合同

         $config['per_page'] = 10;

        //获取页码

        $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
    
        //var_dump($current_page);

            //配置

        $config['base_url'] = site_url('/Finance/contract');

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
        
        $total = count($this->public_model->select_where($this->contract,'del_state','0',''));
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_page_sort($this->contract,$current_page,$config['per_page'],'receivables_state');
        $this->pagination->initialize($config);
        //获取何用收支信息
      
       // var_dump($total);
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());
      //  var_dump($data);
        $this->load->view('finance/financeList.html',$data);
    }
   
   //收入列表
    function complete(){
        $id = intval($this->uri->segment('3'));


         $config['per_page'] = 10;

        //获取页码

        $current_page=intval($this->uri->segment('4'));//index.php 后数第4个/
  

        $config['base_url'] = site_url('/Finance/complete/'.$id);

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
        
        $total = count($this->public_model->select_where_many($this->contract_account,'type','1','contract_id',$id));
        $config['total_rows'] = $total;

        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_page_many($this->contract_account,"type",'1','contract_id',$id,$current_page,$config['per_page'],'');
     //   var_dump($listpage);
        $this->pagination->initialize($config);

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());
        $data['contract_id'] = $id;
        

        $this->load->view('finance/complete.html',$data);
    }

    //新增收入信息
    function complete_add(){
        if($_POST){
            $data = $this->input->post();
            $data['type'] = '1';
            if($this->public_model->insert($this->contract_account,$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增收入记录成功,合同id为".$data['contract_id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.parent.location.reload();</script>";  
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增收入记录失败,合同id为".$data['contract_id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.parent.location.reload();</script>";  
            }
        }else{
            $id = intval($this->uri->segment('3'));
            $data['contractid'] = $id;
            $data['complete'] = '';
            //获取公司职员
            $data['users'] = $this->public_model->select_where_no($this->member,'1','');

            $this->load->view('finance/income.html',$data);

        }
    }

    function edit_complete(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->updata($this->contract_account,'id',$data['id'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"修改收入记录成功,记录id为".$data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.parent.location.reload();</script>";  
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"修改收入记录失败,记录id为".$data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.parent.location.reload();</script>";  
            }
        }else{
            $id = intval($this->uri->segment('3'));
            $data['contractid'] = $id;
            $data['complete'] = $this->public_model->select_info($this->contract_account,'id',$id);
            //获取公司职员
            $data['users'] = $this->public_model->select_where_no($this->member,'1','');

            $this->load->view('finance/income.html',$data);
        }
    }

    //新增支出信息
    function expenditure(){
        //$id = 
        $id = intval($this->uri->segment('3'));

        $config['per_page'] = 10;

        //获取页码

        $current_page=intval($this->uri->segment('4'));//index.php 后数第4个/
    
        //var_dump($current_page);

            //配置

        $config['base_url'] = site_url('/Finance/expenditure/'.$id);

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
        
          $total = count($this->public_model->select_where_many($this->contract_account,'type','2','contract_id',$id));
        $config['total_rows'] = $total;

        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_page_many($this->contract_account,"type",'2','contract_id',$id,$current_page,$config['per_page'],'');
        $this->pagination->initialize($config);
        //获取何用收支信息
      
       // var_dump($total);
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());
      //  var_dump($data);
        $data['contract_id'] = $id;

        $this->load->view('finance/expenditure.html',$data);
    }

    //新增支出信息
      function expenditure_add(){
        if($_POST){
            $data = $this->input->post();
            $data['type'] = '2';
            if($this->public_model->insert($this->contract_account,$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增支出记录成功,合同id为".$data['contract_id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.parent.location.reload();</script>";  
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增支出记录失败,合同id为".$data['contract_id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.parent.location.reload();</script>";  
            }
        }else{
            $id = intval($this->uri->segment('3'));
            $data['contractid'] = $id;
            $data['complete'] = '';
            //获取公司职员
            $data['users'] = $this->public_model->select_where_no($this->member,'1','');

            $this->load->view('finance/expense.html',$data);

        }
    }

    function edit_expenditure(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->updata($this->contract_account,'id',$data['id'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"修改支出记录成功,记录id为".$data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.parent.location.reload();</script>";  
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"修改支出记录失败,记录id为".$data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.parent.location.reload();</script>";  
            }
        }else{
            $id = intval($this->uri->segment('3'));
            $data['contractid'] = $id;
            $data['complete'] = $this->public_model->select_info($this->contract_account,'id',$id);
            //获取公司职员
            $data['users'] = $this->public_model->select_where_no($this->member,'1','');

            $this->load->view('finance/expense.html',$data);
        }
    }

    //开票信息
    function billing(){
         $id = intval($this->uri->segment('3'));

        $config['per_page'] = 10;

        //获取页码

        $current_page=intval($this->uri->segment('4'));//index.php 后数第4个/
    
        //var_dump($current_page);

            //配置

        $config['base_url'] = site_url('/Finance/expenditure/'.$id);

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
        
          $total = count($this->public_model->select_where_many($this->contract_account,'type','3','contract_id',$id));
        $config['total_rows'] = $total;

        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_page_many($this->contract_account,"type",'3','contract_id',$id,$current_page,$config['per_page'],'');
        $this->pagination->initialize($config);
        //获取何用收支信息
      
       // var_dump($total);
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());
      //  var_dump($data);
        $data['contract_id'] = $id;

        $this->load->view('finance/billing.html',$data);

    }

    //新增开票信息
      function billing_add(){
        if($_POST){
            $data = $this->input->post();
            $data['type'] = '3';
            if($this->public_model->insert($this->contract_account,$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增开票记录成功,合同id为".$data['contract_id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.parent.location.reload();</script>";  
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增开票记录失败,合同id为".$data['contract_id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.parent.location.reload();</script>";  
            }
        }else{
            $id = intval($this->uri->segment('3'));
            $data['contractid'] = $id;
            $data['complete'] = '';
            //获取公司职员
          //  $data['users'] = $this->public_model->select_where_no($this->member,'1','');

            $this->load->view('finance/invoice.html',$data);

        }
    }

    function edit_billing(){
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->updata($this->contract_account,'id',$data['id'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"修改开票记录成功,记录id为".$data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.parent.location.reload();</script>";  
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"修改开票记录失败,记录id为".$data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.parent.location.reload();</script>";  
            }
        }else{
            $id = intval($this->uri->segment('3'));
            $data['contractid'] = $id;
            $data['complete'] = $this->public_model->select_info($this->contract_account,'id',$id);
            //获取公司职员
           // $data['users'] = $this->public_model->select_where_no($this->member,'1','');

            $this->load->view('finance/invoice.html',$data);
        }
    }

    //删除
    function del_Balance(){
        if($_POST){
            $id = $this->input->post('id');
            $info= $this->public_model->select_info($this->contract_account,'id',$id);
            if($info['type'] == '1'){
                $title = '删除收入记录';
            }else if($info['type'] == '2'){
                $title = '删除支出记录';
            }else{
              $title = '删除开票记录';
            }

            if($this->public_model->delete($this->contract_account,'id',$id)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>$title."成功,合同id为".$info['contract_id'],
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
                    'log_message'=>$title."失败,合同id为".$info['contract_id'],
                );
                add_system_log($arr);
                echo "2";  
            }
        }else{
            echo "2";
        }
    }


}