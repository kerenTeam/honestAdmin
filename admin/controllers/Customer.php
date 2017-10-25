<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');
// 客户挂历
class Customer extends Public_Controller
{

    public $customer = 'customer';
    public $customer_user = 'customer_contacts';
    public $category = 'category';
    public $member = 'user_member';
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
        
        $total = count($this->public_model->select_where($this->customer,'state','1','addtime'));
        $config['total_rows'] = $total;
    
        $this->load->library('pagination');//加载ci pagination类
        $listpage =  $this->public_model->select_page_where($this->customer,'state','1',$current_page,$config['per_page'],'');
        $this->pagination->initialize($config);

        //获取行业类别
        $industry = $this->public_model->select_where($this->category,'type','1','');
  
       
       $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'industry'=>$industry);


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
             //获取行业类别
            $data['industry'] = $this->public_model->select_where($this->category,'type','1','');
            //获取所有用户
            $data['users'] = $this->public_model->select_where_no($this->member,'1','');
            $this->load->view('customer/newCompany.html',$data);
        }
        
    }

    //新增联系人
    function add_customer_user(){
    
        if($_POST){
            $q = $this->uri->uri_string();
            $ret =  if_user_power($q,$_SESSION['power']);
            if($ret == '0'){
               echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.location.href='".site_url('/Customer/index')."'</script>";
               exit;
           }
           $data = $this->input->post();
           if($this->public_model->insert($this->customer_user,$data)){
               $arr = array(
                   'log_url'=>$this->uri->uri_string(),
                   'user_id'=>$_SESSION['users']['user_id'],
                   'username'=>$_SESSION['users']['username'],
                   'log_ip'=>get_client_ip(),
                   'log_status'=>'1',
                   'log_message'=>"新增客户联系人成功,联系人名称为".$data['name'],
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
                   'log_message'=>"新增客户联系人失败,联系人名称为".$data['name'],
               );
               add_system_log($arr);
               echo "<script>alert('操作失败！');window.location.href='".site_url('/Customer/index')."'</script>";  
           }
        }else{
            $data['id'] = intval($this->uri->segment('3'));
            $this->load->view('customer/companyLinkman.html',$data);
        }
    }

    //修改客户联系人
    function edit_customer_user(){
        if($_POST){
            $q = $this->uri->uri_string();
            $ret =  if_user_power($q,$_SESSION['power']);
            if($ret == '0'){
               echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.location.href='".site_url('/Customer/index')."'</script>";
               exit;
           }
           $data = $this->input->post();
           if($this->public_model->updata($this->customer_user,'id',$data['id'],$data)){
               $arr = array(
                   'log_url'=>$this->uri->uri_string(),
                   'user_id'=>$_SESSION['users']['user_id'],
                   'username'=>$_SESSION['users']['username'],
                   'log_ip'=>get_client_ip(),
                   'log_status'=>'1',
                   'log_message'=>"修改客户联系人成功,联系人名称为".$data['name'],
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
                   'log_message'=>"修改客户联系人失败,联系人名称为".$data['name'],
               );
               add_system_log($arr);
               echo "<script>alert('操作失败！');window.location.href='".site_url('/Customer/index')."'</script>";  
           }
        }else{
            $id = intval($this->uri->segment('3'));

            $data['user'] = $this->public_model->select_info($this->customer_user,'id',$id);

            $this->load->view('customer/companyLinkman.html',$data);
        }
    }


    //删除客户
    function edit_customer_status(){
        $q = $this->uri->uri_string();
        $ret =  if_user_power($q,$_SESSION['power']);
        if($ret == '0'){
           echo "3";
           exit;
       }
        if($_POST){
            $data = $this->input->post();
            if($this->public_model->updata($this->customer,'id',$data['id'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除客户联系人成功,联系人id为".$data['id'],
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
                    'log_message'=>"删除客户联系人失败,联系人id为".$data['id'],
                );
                add_system_log($arr);
                echo "2";  
            }
        }else{
            echo "2";
        }
    }

    //编辑客户信息
    function edit_customer(){
        $id = intval($this->uri->segment('3'));
        if($id == '0'){
            $this->load->view('404.html');
        }else{
            //获取客户信息
            $data['customer'] = $this->public_model->select_info($this->customer,'id',$id);
              //获取行业类别
            $data['industry'] = $this->public_model->select_where($this->category,'type','1','');
            //获取所有用户
            $data['users'] = $this->public_model->select_where_no($this->member,'1','');

            $this->load->view('customer/editCompany.html',$data);

        }
    }
    //编辑操作
    function edit_customerInfo(){
        if($_POST){
            $data = $this->input->post();

            if($this->public_model->updata($this->customer,'id',$data['id'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"修改客户信息成功,客户id为".$data['id'],
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
                    'log_message'=>"修改客户信息失败,客户id为".$data['id'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Customer/edit_customer／'.$data['id'])."'</script>";  
            }
        }else{
            $this->load->view('404.html');
        }
    }



    //筛选客户
    function search_customer(){
        $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->input->get("size"));//index.php 后数第4个/

        $industry = $this->input->get('industry');
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



        $list = search_customer($industry,$sear);
       

        $config['total_rows'] = count($list);

        $config['page_query_string'] = TRUE;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Coustomer/search_customer?').'industry='.$industry.'&sear='.$sear;

        // //分页数据\
        $listpage = search_customer_page($industry,$sear,$config['per_page'],$current_page);
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

        // var_dump($data);
        $type = $this->public_model->select_where($this->category,'type','1','');
  
       
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'industry'=>$type);
        $this->load->view('customer/companySet.html',$data);
    }




    //导入联系人
    function import_customer(){
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

            $data['contract_number'] = $PHPExcel->getActiveSheet()->getCell("A".$currentRow)->getValue();//获取c列的值
            //合同号
            $data['title'] = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取c列的值
            

            $data['industry'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();//获取d列的值

            $data['address'] = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();//获取d列的值

            $data['postcode'] = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();//获取d列的值

            $data['province'] = $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();//获取d列的值

            $data['city'] = $PHPExcel->getActiveSheet()->getCell("G".$currentRow)->getValue();//获取d列的值

            $data['area'] = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();//获取d列的值

            $data['phone1'] = $PHPExcel->getActiveSheet()->getCell("I".$currentRow)->getValue();//获取d列的值

            
            $data['tax_on'] = $PHPExcel->getActiveSheet()->getCell("J".$currentRow)->getValue();//获取d列的值
            
            $data['open_bank'] = $PHPExcel->getActiveSheet()->getCell("K".$currentRow)->getValue();//获取d列的值
            $data['bank_account'] = $PHPExcel->getActiveSheet()->getCell("L".$currentRow)->getValue();//获取d列的值
            $data['email'] = $PHPExcel->getActiveSheet()->getCell("M".$currentRow)->getValue();//获取d列的值
            $data['remarks'] = $PHPExcel->getActiveSheet()->getCell("N".$currentRow)->getValue();//获取d列的值

            //客户联系人
            $arr['name'] = $PHPExcel->getActiveSheet()->getCell("O".$currentRow)->getValue();
            $arr['department'] = $PHPExcel->getActiveSheet()->getCell("P".$currentRow)->getValue();
            $arr['duties'] = $PHPExcel->getActiveSheet()->getCell("Q".$currentRow)->getValue();
            $arr['phone'] = $PHPExcel->getActiveSheet()->getCell("R".$currentRow)->getValue();
            $arr['email'] = $PHPExcel->getActiveSheet()->getCell("S".$currentRow)->getValue();
            $arr['facsimile'] = $PHPExcel->getActiveSheet()->getCell("T".$currentRow)->getValue();

          
            $likman = $PHPExcel->getActiveSheet()->getCell("U".$currentRow)->getValue();
            //获取本公司对接人id
            $user = $this->public_model->select_info($this->member,'username',$likman);
            if(!empty($user)){
                $data['linkman'] = $user['user_id'];
                $arr['link_man'] = $user['user_id'];
            }


            
            if($data['contract_number'] == NULL){

                //删除临时文件
                @unlink($inputFileName);
                exit;

            } 

            //新增合同
            $c = $this->public_model->insert_id($this->customer,$data);
            if($c){
                $yes[] = $currentRow;
                $arr['company_name'] = $data['title'];
                $arr['company_id'] = $c;
                $this->public_model->insert($this->customer_user,$arr);
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
            'log_message'=>"导入了客户信息，导入成功".$ret['yes']."条，失败".$ret['error']."条，失败条目：".implode(',',$ret['errorlist']),
        );
        add_system_log($arr);   
        echo $arr['log_message'];
    }
    
    

}