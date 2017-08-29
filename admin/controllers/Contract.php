<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');

// 合同管理
class Contract extends Public_Controller
{

    //  
    public $category = "category";
    public $customer = "customer";
    public $contract = "contract";

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

        $config['base_url'] = site_url('/Contract/index');

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
        $listpage =  $this->public_model->select_page_where($this->contract,"del_state",'0',$current_page,$config['per_page'],'contract_id');
        $this->pagination->initialize($config);

        //获取行业类别
        $industry = $this->public_model->select_where($this->category,'type','1','');
        $service = $this->public_model->select_where($this->category,'type','2','');
        $technology = $this->public_model->select_where($this->category,'type','3','');
        //获取客户信息
        $customer = $this->public_model->select_where($this->customer,'state','1','');
        
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'industry'=>$industry,'service'=>$service,'technology'=>$technology,'customer'=>$customer);

        
        $this->load->view('cont/contractAdmin.html',$data);
    }

    //新增客户
    function add_contract(){
        $q = $this->uri->uri_string();
        $ret =  if_user_power($q,$_SESSION['power']);
        if($ret == '0'){
           echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.location.href='".site_url('/Contract/index')."'</script>";
           exit;
        }
        if($_POST){
            $data = $this->input->post();
            $data['contract_year'] = date('Y');
            //获取合同数量
            $total = count($this->public_model->select($this->contract,''));
            $num = $total+1;
            $data['contract_number'] = date('Ymd').$num;
            if($this->public_model->insert($this->contract,$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增合同成功,合同名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Contract/index')."'</script>";  
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增合同失败,合同名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Contract/index')."'</script>";  
            }
        }else{
            $this->load->view('404.html');
        }
    }


    //编辑合同信息
    function edit_contract(){
        if($_POST){
            $q = $this->uri->uri_string();
            $ret =  if_user_power($q,$_SESSION['power']);
            if($ret == '0'){
               echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.location.href='".site_url('/Contract/index')."'</script>";
               exit;
            }
            $data = $this->input->post();
            if($this->public_model->updata($this->contract,'contract_id',$data['contract_id'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"修改合同成功,合同名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Contract/index')."'</script>";  
            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"修改合同失败,合同名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Contract/index')."'</script>";  
            }
        }else{
            $id = intval($this->uri->segment(3));
            $data['contract'] = $this->public_model->select_info($this->contract,'contract_id',$id);
            
            //获取行业类别
            $data['industry'] = $this->public_model->select_where($this->category,'type','1','');
            $data['service'] = $this->public_model->select_where($this->category,'type','2','');
            $data['technology'] = $this->public_model->select_where($this->category,'type','3','');
            //获取客户信息
            $data['customer'] = $this->public_model->select_where($this->customer,'state','1','');

            $this->load->view('cont/editContact.html',$data);
        }
    }


    //删除合同
    function del_contract_state(){
        $q = $this->uri->uri_string();
        $ret =  if_user_power($q,$_SESSION['power']);
        if($ret == '0'){
           echo "3";
           exit;
        }
        if($_POST){
           
            $id = $this->input->post('id');
            $data['del_state'] = '1';
            if($this->public_model->updata($this->contract,'contract_id',$id,$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除合同成功,合同id为".$id,
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
                    'log_message'=>"删除合同失败,合同id为".$id,
                );
                add_system_log($arr);
                echo "2";  
            }
        }else{
            echo "2";
        }
    }


    //合同导入
    function import_contract(){
     
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

        $erp_orders_id = array();  //声明数组
     
        for($currentRow = 2;$currentRow <= $allRow;$currentRow++){

            $data['contract_year'] = $PHPExcel->getActiveSheet()->getCell("A".$currentRow)->getValue();//获取c列的值

            $data['contract_id'] = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取c列的值

            $data['contract_number'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();//获取d列的值

            $data['province'] = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();//获取d列的值

            $data['city'] = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();//获取d列的值

            $data['area'] = $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();//获取d列的值

            $data['plate'] = $PHPExcel->getActiveSheet()->getCell("G".$currentRow)->getValue();//获取d列的值

            $data['industry'] = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();//获取d列的值

            $data['army'] = $PHPExcel->getActiveSheet()->getCell("I".$currentRow)->getValue();//获取d列的值

            $data['service_tyep'] = $PHPExcel->getActiveSheet()->getCell("J".$currentRow)->getValue();//获取d列的值
           
            $data['title'] = $PHPExcel->getActiveSheet()->getCell("K".$currentRow)->getValue();//获取d列的值
            $data['contract_situation'] = $PHPExcel->getActiveSheet()->getCell("L".$currentRow)->getValue();//获取d列的值
            $data['sign_date'] = $PHPExcel->getActiveSheet()->getCell("M".$currentRow)->getValue();//获取d列的值
            $data['sign_user'] = $PHPExcel->getActiveSheet()->getCell("N".$currentRow)->getValue();//获取d列的值
            $data['customer_id'] = $PHPExcel->getActiveSheet()->getCell("O".$currentRow)->getValue();//获取d列的值
            $data['estimate_price'] = $PHPExcel->getActiveSheet()->getCell("P".$currentRow)->getValue();//获取d列的值
            $data['contract_price'] = $PHPExcel->getActiveSheet()->getCell("Q".$currentRow)->getValue();//获取d列的值
            $data['review_price'] = $PHPExcel->getActiveSheet()->getCell("R".$currentRow)->getValue();//获取d列的值
            $data['prepay'] = $PHPExcel->getActiveSheet()->getCell("S".$currentRow)->getValue();//获取d列的值
            $data['expenditure'] = $PHPExcel->getActiveSheet()->getCell("T".$currentRow)->getValue();//获取d列的值
            $data['remaks'] = $PHPExcel->getActiveSheet()->getCell("U".$currentRow)->getValue();//获取d列的值
         
            if($data['contract_number'] == NULL){

                    //删除临时文件
                @unlink($inputFileName);
                exit;

            } 
            // var_dump($data);
        
           
            //新增合同
            if($this->public_model->insert($this->contract,$data)){
                $yes[] = $currentRow;
            }else{
                $error[] = $currentRow;
            }

            // exit;   
         
        }

        $ret = array('yes'=>count($yes),'error'=>count($error),'yeslist'=>$yes,'errorlist'=>$error);
        
                   //日志
        
        $arr = array(
            'log_url'=>$this->uri->uri_string(),
            'user_id'=>$_SESSION['users']['user_id'],
            'username'=>$_SESSION['users']['username'],
            'log_ip'=>get_client_ip(),
            'log_status'=>'1',
            'log_message'=>"导入了商品信息，导入成功".$ret['yes']."条，失败".$ret['error']."条，失败条目：".implode(',',$ret['errorlist']),
        );
        add_system_log($arr);   
        echo $arr['log_message'];

    }





}