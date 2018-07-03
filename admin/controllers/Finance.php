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

        //获取合同信息
        $cont = $this->public_model->select_info($this->contract,'contract_id',$id);

        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'cont'=>$cont);
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
          //获取合同信息
        $cont = $this->public_model->select_info($this->contract,'contract_id',$id);

   
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'cont'=>$cont);
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
        //获取合同信息
        $cont = $this->public_model->select_info($this->contract,'contract_id',$id);

   
       // var_dump($total);
        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'cont'=>$cont);
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


    //财务合同详情
    function contract_info(){
        $id = $this->uri->segment('3');
        if($id == '0'){
            $this->load->view('404.html');
        }else{
            $data['cont'] = $this->public_model->contract_info($id);
           
            $this->load->view('finance/contractInfo.html',$data);
        }
    }



    //财务收支倒入
    function Import_income(){
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
                //合同号
                $contract_id = $PHPExcel->getActiveSheet()->getCell("A".$currentRow)->getValue();//获取c列的值
                $data['contract_number'] = $contract_id;
                //获取合同id
                $contract = $this->public_model->select_info($this->contract,'contract_number',$contract_id);
                if(empty($contract)){
                    $data['contract_id'] = '1';
                }else{
                    $data['contract_id'] = $contract['contract_id'];
                }

                $data['price'] = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取d列的值
    
                $data['voucher'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();//获取d列的值
    
                $time = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();//获取d列的值
                if(!empty($time)){
                    $scene = $time - 25569; //获得秒数
                    $data['time'] = date('Y-m-d', $scene*24*60*60); 
                }
    
                $name = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();//获取d列的值
                $user = $this->public_model->select_info($this->member,'username',trim($name));

                if(!empty($user)){
                    $data['handler'] = $user['user_id'];
                }
                $data['receivables'] = $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();//获取d列的值
                $data['detailed'] = $PHPExcel->getActiveSheet()->getCell("G".$currentRow)->getValue();//获取d列的值
                $data['remaks'] = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();//获取d列的值
     
                $data['type'] = '1';
                if($contract_id == NULL){
    
                        //删除临时文件
                    @unlink($inputFileName);
                    break;
    
                } 
                //新增合同收支
                if($this->public_model->insert($this->contract_account,$data)){
                    $yes[] = $currentRow;
                }else{
                    $error[] = $currentRow;
                }
            }
            $ret = array('yes'=>count($yes),'error'=>count($error),'yeslist'=>$yes,'errorlist'=>$error);
            // var_dump($ret);
            // // //            //日志
            
            $arr = array(
                'log_url'=>$this->uri->uri_string(),
                'user_id'=>$_SESSION['users']['user_id'],
                'username'=>$_SESSION['users']['username'],
                'log_ip'=>get_client_ip(),
                'log_status'=>'1',
                'log_message'=>"导入了合同收入信息，导入成功".$ret['yes']."条，失败".$ret['error']."条，失败条目：".implode(',',$ret['errorlist']),
            );
            add_system_log($arr);   
            echo $arr['log_message'];
    }

    //支出导入
    function Import_expenditure(){
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
            //合同号
            $contract_id = $PHPExcel->getActiveSheet()->getCell("A".$currentRow)->getValue();//获取c列的值
            $data['contract_number'] = $contract_id;
            //获取合同id
            $contract = $this->public_model->select_info($this->contract,'contract_number',$contract_id);
            if(empty($contract)){
                $data['contract_id'] = '1';
            }else{
                $data['contract_id'] = $contract['contract_id'];
            }

            $data['price'] = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取d列的值

            $data['voucher'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();//获取d列的值

            $time = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();//获取d列的值
            if(!empty($time)){
                $scene = $time - 25569; //获得秒数
                $data['time'] = date('Y-m-d', $scene*24*60*60); 
            }
            $data['expenditure_type'] = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();//获取d列的值

            //报销人
            $name = $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();//获取d列的值
            $user = $this->public_model->select_info($this->member,'username',trim($name));

            if(!empty($user)){
                $data['reimbursement'] = $user['user_id'];
            }else{
                $error[] = $currentRow;
                continue;   
            }
            //批准人
            $approval = $PHPExcel->getActiveSheet()->getCell("G".$currentRow)->getValue();//获取d列的值
            $users = $this->public_model->select_info($this->member,'username',trim($approval));

            if(!empty($user)){
                $data['approval'] = $users['user_id'];
            }else{
                $error[] = $currentRow;
                continue;   
            }


            $data['type'] = '2';
            $data['receivables'] = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();//获取d列的值
            $data['remaks'] = $PHPExcel->getActiveSheet()->getCell("I".$currentRow)->getValue();//获取d列的值
            // $data['remaks'] = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();//获取d列的值
            if($contract_id == NULL){

                    //删除临时文件
                @unlink($inputFileName);
                exit;

            } 
        
           
            //新增合同
            if($this->public_model->insert($this->contract_account,$data)){
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
            'log_message'=>"导入了合同支出信息，导入成功".$ret['yes']."条，失败".$ret['error']."条，失败条目：".implode(',',$ret['errorlist']),
        );
        add_system_log($arr);   
        echo $arr['log_message'];
    }

    //开票信息导入
    function Import_billing(){
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
            //合同号
            $contract_id = $PHPExcel->getActiveSheet()->getCell("A".$currentRow)->getValue();//获取c列的值
            $data['contract_number'] = $contract_id;
            //获取合同id
            $contract = $this->public_model->select_info($this->contract,'contract_number',$contract_id);
            if(empty($contract)){
                $data['contract_id'] = '1';
            }else{
                $data['contract_id'] = $contract['contract_id'];
            }

            $data['price'] = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取d列的值

            $data['billing_type'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();//获取d列的值
            $data['invoice_num'] = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();//获取d列的值

            $time = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();//获取d列的值
            if(!empty($time)){
                $scene = $time - 25569; //获得秒数
                $data['time'] = date('Y-m-d', $scene*24*60*60); 
            }
            $data['remaks'] = $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();//获取d列的值
          
            // $data['remaks'] = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();//获取d列的值
            if($contract_id == NULL){

                    //删除临时文件
                @unlink($inputFileName);
                break;

            } 
            // var_dump($data);
        
            $data['type'] = '3';
            // //新增合同
            if($this->public_model->insert($this->contract_account,$data)){
                $yes[] = $currentRow;
            }else{
                $error[] = $currentRow;
            }
        }
        $ret = array('yes'=>count($yes),'error'=>count($error),'yeslist'=>$yes,'errorlist'=>$error);
        
        // //            //日志
        
        $arr = array(
            'log_url'=>$this->uri->uri_string(),
            'user_id'=>$_SESSION['users']['user_id'],
            'username'=>$_SESSION['users']['username'],
            'log_ip'=>get_client_ip(),
            'log_status'=>'1',
            'log_message'=>"导入了合同开票信息，导入成功".$ret['yes']."条，失败".$ret['error']."条，失败条目：".implode(',',$ret['errorlist']),
        );
        add_system_log($arr);   
        echo $arr['log_message'];
    }


    //出纳 现金
    function cashAccount(){
        $name = date('Y-m-d');
        $inputFileName = "upload/xls/" .$name .'.xls';
        $type = $_POST['type'];
        move_uploaded_file($_FILES["pics"]["tmp_name"],$inputFileName);
        //引入类库
        $this->load->library('excel');
        if(!file_exists($inputFileName)){

                echo "<script>alert('文件导入失败!');window.location.href='".site_url('/Welcome/Import_Record')."'</script>";
                exit;
        }

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
            //
           
            $time = $PHPExcel->getActiveSheet()->getCell("A".$currentRow)->getValue();//获取c列的值
            if(!empty($time)){
                $data['createTime'] = gmdate("Y-m-d", PHPExcel_Shared_Date::ExcelToPHP($time));
            }

            $data['userName'] = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取c列的值
            $data['collectType'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();//获取c列的值
            $data['remarks'] = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();//获取c列的值
            $data['price'] = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();//获取c列的值
            
            if($type == '2'){

                $data['travel'] = $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();//获取c列的值
                $data['hotel'] = $PHPExcel->getActiveSheet()->getCell("G".$currentRow)->getValue();//获取c列的值
                $data['hospitality'] = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();//获取c列的值
                $data['meals'] = $PHPExcel->getActiveSheet()->getCell("I".$currentRow)->getValue();//获取c列的值
                $data['gasoline'] = $PHPExcel->getActiveSheet()->getCell("J".$currentRow)->getValue();//获取c列的值
                $data['roadToll'] = $PHPExcel->getActiveSheet()->getCell("K".$currentRow)->getValue();//获取c列的值
                $data['parking'] = $PHPExcel->getActiveSheet()->getCell("L".$currentRow)->getValue();//获取c列的值
                $data['repair'] = $PHPExcel->getActiveSheet()->getCell("M".$currentRow)->getValue();//获取c列的值
                $data['traffic'] = $PHPExcel->getActiveSheet()->getCell("N".$currentRow)->getValue();//获取c列的值
                $data['EMS'] = $PHPExcel->getActiveSheet()->getCell("O".$currentRow)->getValue();//获取c列的值

            }
            $data['type'] = $type;          
            // $data['remaks'] = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();//获取d列的值
            if($time == NULL){

                    //删除临时文件
                @unlink($inputFileName);
                break;

            } 

            // //新增合同
            if($this->public_model->insert('h_cashier_cash',$data)){
                $yes[] = $currentRow;
            }else{
                $error[] = $currentRow;
            }
        }
        $ret = array('yes'=>count($yes),'error'=>count($error),'yeslist'=>$yes,'errorlist'=>$error);
        
        // //            //日志
        
        $arr = array(
            'log_url'=>$this->uri->uri_string(),
            'user_id'=>$_SESSION['users']['user_id'],
            'username'=>$_SESSION['users']['username'],
            'log_ip'=>get_client_ip(),
            'log_status'=>'1',
            'log_message'=>"导入了出纳现金收支信息，导入成功".$ret['yes']."条，失败".$ret['error']."条，失败条目：".implode(',',$ret['errorlist']),
        );
        add_system_log($arr);   
        echo $arr['log_message'];

    }
    //出纳 银行
    function bankAccount(){
        $name = date('Y-m-d');
        $inputFileName = "upload/xls/" .$name .'.xls';
        $type = $_POST['type'];
        move_uploaded_file($_FILES["pics"]["tmp_name"],$inputFileName);
        //引入类库
        $this->load->library('excel');
        if(!file_exists($inputFileName)){

                echo "<script>alert('文件导入失败!');window.location.href='".site_url('/Welcome/Import_Record')."'</script>";
                exit;
        }

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
            //
           
            $time = $PHPExcel->getActiveSheet()->getCell("A".$currentRow)->getValue();//获取c列的值
            if(!empty($time)){
                $data['createTime'] = gmdate("Y-m-d", PHPExcel_Shared_Date::ExcelToPHP($time));
            }

            $data['bankName'] = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取c列的值
            $data['collectType'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();//获取c列的值
            $data['remarks'] = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();//获取c列的值
            $data['price'] = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();//获取c列的值
            
           
            $data['type'] = $type;          
            // $data['remaks'] = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();//获取d列的值
            if($time == NULL){

                    //删除临时文件
                @unlink($inputFileName);
                break;

            } 

            // //新增合同
            if($this->public_model->insert('h_cashier_bank',$data)){
                $yes[] = $currentRow;
            }else{
                $error[] = $currentRow;
            }
        }
        $ret = array('yes'=>count($yes),'error'=>count($error),'yeslist'=>$yes,'errorlist'=>$error);
        
        // //            //日志
        
        $arr = array(
            'log_url'=>$this->uri->uri_string(),
            'user_id'=>$_SESSION['users']['user_id'],
            'username'=>$_SESSION['users']['username'],
            'log_ip'=>get_client_ip(),
            'log_status'=>'1',
            'log_message'=>"导入了出纳银行收支信息，导入成功".$ret['yes']."条，失败".$ret['error']."条，失败条目：".implode(',',$ret['errorlist']),
        );
        add_system_log($arr);   
        echo $arr['log_message'];

    }
    //出纳 承兑
    function acceptance(){
        $name = date('Y-m-d');
        $inputFileName = "upload/xls/" .$name .'.xls';
        $type = $_POST['type'];
        move_uploaded_file($_FILES["pics"]["tmp_name"],$inputFileName);
        //引入类库
        $this->load->library('excel');
        if(!file_exists($inputFileName)){

                echo "<script>alert('文件导入失败!');window.location.href='".site_url('/Welcome/Import_Record')."'</script>";
                exit;
        }

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
            //
           
           
            if($type == '1'){
                $time = $PHPExcel->getActiveSheet()->getCell("A".$currentRow)->getValue();//获取c列的值
                if(!empty($time)){
                    $data['dateTime'] = gmdate("Y-m-d", PHPExcel_Shared_Date::ExcelToPHP($time));
                }

                $data['company'] = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取c列的值
                $data['bankName'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();//获取c列的值
                $data['draftNum'] = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();//获取c列的值
                $data['draftEnd'] = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();//获取c列的值
                $data['balance'] = $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();//获取c列的值
                $data['remarks'] = $PHPExcel->getActiveSheet()->getCell("G".$currentRow)->getValue();//获取c列的值
                if($time == NULL){

                    //删除临时文件
                    @unlink($inputFileName);
                    break;

                } 

            }else{
                $destroyTime = $PHPExcel->getActiveSheet()->getCell("A".$currentRow)->getValue();//获取c列的值
                if(!empty($destroyTime)){
                    $data['destroyTime'] = gmdate("Y-m-d", PHPExcel_Shared_Date::ExcelToPHP($destroyTime));
                }
                $data['draftNum'] = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取c列的值
                $data['balance'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();//获取c列的值
                $collectionTime = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();//获取c列的值
                if(!empty($collectionTime)){
                    $data['collectionTime'] = gmdate("Y-m-d", PHPExcel_Shared_Date::ExcelToPHP($collectionTime));
                }
                   
                $arrival = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();//获取c列的值
                if(!empty($arrival)){
                    $data['arrival'] = gmdate("Y-m-d", PHPExcel_Shared_Date::ExcelToPHP($arrival));
                }
                $data['remarks'] = $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();//获取c列的值
                if($destroyTime == NULL){

                        //删除临时文件
                    @unlink($inputFileName);
                    break;

                } 

            }
           
            $data['type'] = $type;          
           
            // //新增合同
            if($this->public_model->insert('h_cashier_acceptance',$data)){
                $yes[] = $currentRow;
            }else{
                $error[] = $currentRow;
            }
        }
        $ret = array('yes'=>count($yes),'error'=>count($error),'yeslist'=>$yes,'errorlist'=>$error);
        
        // //            //日志
        
        $arr = array(
            'log_url'=>$this->uri->uri_string(),
            'user_id'=>$_SESSION['users']['user_id'],
            'username'=>$_SESSION['users']['username'],
            'log_ip'=>get_client_ip(),
            'log_status'=>'1',
            'log_message'=>"导入了出纳承兑收支信息，导入成功".$ret['yes']."条，失败".$ret['error']."条，失败条目：".implode(',',$ret['errorlist']),
        );
        add_system_log($arr);   
        echo $arr['log_message'];

    }







}