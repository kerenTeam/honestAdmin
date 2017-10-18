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
    public $member = "user_member";
    public $project = "project";
    public $customer_con = "customer_contacts";



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

        $listpage =  $this->public_model->contract_page_where($this->contract,"del_state",'0',$current_page,$config['per_page'],'lssued_state');
        $this->pagination->initialize($config);

        //获取行业类别
        $industry = $this->public_model->select_where($this->category,'type','1','');
        $service = $this->public_model->select_where($this->category,'type','2','');
        $technology = $this->public_model->select_where($this->category,'type','3','');
        //获取客户信息
        $customer = $this->public_model->select_where($this->customer,'state','1','');
        
        //获取职员信息
        $users = $this->public_model->select_where_no($this->member,'1','');




        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'industry'=>$industry,'service'=>$service,'technology'=>$technology,'customer'=>$customer,'users'=>$users);

        $this->load->view('cont/contractAdmin.html',$data);
    }

    //新增合同
    function add_contract(){
        $q = $this->uri->uri_string();
        $ret =  if_user_power($q,$_SESSION['power']);
        if($ret == '0'){
           echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.parent.location.reload();</script>";
           exit;
        }
        if($_POST){
            $data = $this->input->post();
            $data['contract_year'] = date('Y');
            //获取合同数量
            $total = count($this->public_model->select($this->contract,''));
            $num = $total+1;
            $data['contract_number'] = date('Ymd').$num;

           // var_dump($_FILES);
           // exit;
            // 上传文件
            if(!empty($_FILES['contractFile']['name'])){
                $config['upload_path']      = 'upload/contract/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg|xls|xlsx|doc|docx';
                $config['max_size']     = 5120;
                $config['file_name'] = $data['contract_number'].$data['title'];

                $this->load->library('upload', $config);

                // 上传

                if(!$this->upload->do_upload('contractFile')) {

                    echo "<script>alert('合同书上传失败！');window.parent.location.reload();</script>";exit;
                }else{
                    $data['contract_file'] = 'upload/contract/'.$this->upload->data('file_name');
                }
            }
      
            if(!empty($_FILES['entrust']['name'])){
                $config['upload_path']      = 'upload/entrust/';
                $config['allowed_types']    = 'jpg|png|jpeg|xls|xlsx|doc|docx'; 
                $config['max_size']     = 5120;
                $config['file_name'] = $data['contract_number'].$data['title'];

                $this->load->library('upload', $config);

                // 上传
                if(!$this->upload->do_upload('entrust')) {
                   echo "<script>alert('委托书上传失败！');window.parent.location.reload();</script>";exit;
                }else{
                    $data['entrust_file'] = 'upload/entrust/'.$this->upload->data('file_name');
                }
            }


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
                echo "<script>alert('操作成功！');window.parent.location.reload();</script>";  
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
                echo "<script>alert('操作失败！');window.parent.location.reload();</script>";  
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
               echo "<script>alert('您暂无权限执行此操作！请联系系统管理员。');window.parent.location.reload();</script>";
               exit;
            }
            $data = $this->input->post();

            if(!empty($_FILES['contractFile']['name'])){
                $config['upload_path']      = 'upload/contract/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg|xls|xlsx|doc|docx';
                $config['max_size']     = 5120;
                $config['file_name'] = $data['contract_number'].$data['title'];

                $this->load->library('upload', $config);

                // 上传

                if(!$this->upload->do_upload('contractFile')) {

                    echo "<script>alert('文件2上传失败！');window.parent.location.reload();</script>";exit;
                }else{
                    $data['contract_file'] = 'upload/contract/'.$this->upload->data('file_name');
                }
            }

            if(!empty($_FILES['entrust']['name'])){
                $config['upload_path']      = 'upload/entrust/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg|xls|xlsx|doc|docx'; 
                $config['max_size']     = 5120;
                $config['file_name'] = $data['contract_number'].$data['title'];

                $this->load->library('upload', $config);

                // 上传
                if(!$this->upload->do_upload('entrust')) {

                    echo $this->upload->display_errors();exit;
                }else{
                    $data['entrust_file'] = 'upload/entrust/'.$this->upload->data('file_name');
                }
            }

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
                echo "<script>alert('操作成功！');window.parent.location.reload();</script>";  
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
                echo "<script>alert('操作失败！');window.parent.location.reload();</script>";  
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
                    $data['users'] = $this->public_model->select_where_no($this->member,'1','');

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
            $cont = $this->public_model->select_info($this->contract,'contract_id',$id);
            $data['del_state'] = '1';
            if($this->public_model->updata($this->contract,'contract_id',$id,$data)){
                //修改这个合同下的所有项目的状态
                $this->public_model->updata($this->project,'c_number',$cont['contract_number'],$data);
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

                echo "<script>alert('文件导入失败!');window.parent.location.reload();</script>";

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

            $data['contract_number'] = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取c列的值
            //获取客户编号
            $num = $this->public_model->select_info($this->customer,'contract_number',$data['contract_number']);
            $data['customer_id'] = $num['id'];

            $data['province'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();//获取d列的值

            $data['city'] = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();//获取d列的值

            $data['area'] = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();//获取d列的值

            $data['plate'] = $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();//获取d列的值

            $data['industry'] = $PHPExcel->getActiveSheet()->getCell("G".$currentRow)->getValue();//获取d列的值

            $data['army'] = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();//获取d列的值

            $data['service_tyep'] = $PHPExcel->getActiveSheet()->getCell("I".$currentRow)->getValue();//获取d列的值
           
            $data['title'] = $PHPExcel->getActiveSheet()->getCell("J".$currentRow)->getValue();//获取d列的值
            $data['contract_situation'] = $PHPExcel->getActiveSheet()->getCell("K".$currentRow)->getValue();//获取d列的值
            $timenum= $PHPExcel->getActiveSheet()->getCell("L".$currentRow)->getValue();//获取d列的值
            if(!empty($timenum)){
            $time = $timenum - 25569; //获得秒数
            $data['sign_date'] = date('Y-m-d', $time*24*60*60);
            }
            $name = $PHPExcel->getActiveSheet()->getCell("M".$currentRow)->getValue();
            //获取签盯人id
            $user = $this->public_model->select_info($this->member,'username',trim($name));
            $data['sign_user'] = $user['user_id'];


            //获取d列的值
            $data['estimate_price'] = $PHPExcel->getActiveSheet()->getCell("N".$currentRow)->getValue();//获取d列的值
            $data['contract_price'] = $PHPExcel->getActiveSheet()->getCell("O".$currentRow)->getValue();//获取d列的值
            $data['review_price'] = $PHPExcel->getActiveSheet()->getCell("P".$currentRow)->getValue();//获取d列的值
            $data['prepay'] = $PHPExcel->getActiveSheet()->getCell("Q".$currentRow)->getValue();//获取d列的值
            $data['expenditure'] = $PHPExcel->getActiveSheet()->getCell("TR".$currentRow)->getValue();//获取d列的值
            $data['remaks'] = $PHPExcel->getActiveSheet()->getCell("S".$currentRow)->getValue();//获取d列的值
         
            if($data['contract_year'] == NULL){

                    //删除临时文件
                @unlink($inputFileName);
                break;

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


    //搜索合同
    function search_contract(){
         $config['per_page'] = 10;
        //获取页码
        $current_page=intval($this->input->get("size"));//index.php 后数第4个/

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



        $list = search_contract($sear);


        $config['total_rows'] = count($list);

        $config['page_query_string'] = TRUE;//关键配置
        // $config['reuse_query_string'] = FALSE;
        $config['query_string_segment'] = 'size';
        $config['base_url'] = site_url('/Contract/search_contract?').'sear='.$sear;

        // //分页数据\
        $listpage = search_contract_page($sear,$config['per_page'],$current_page);
        $this->load->library('pagination');//加载ci pagination类

        $this->pagination->initialize($config);

             //获取行业类别
        $industry = $this->public_model->select_where($this->category,'type','1','');
        $service = $this->public_model->select_where($this->category,'type','2','');
        $technology = $this->public_model->select_where($this->category,'type','3','');
        //获取客户信息
        $customer = $this->public_model->select_where($this->customer,'state','1','');
        
        //获取职员信息
        $users = $this->public_model->select_where_no($this->member,'1','');




        $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'industry'=>$industry,'service'=>$service,'technology'=>$technology,'customer'=>$customer,'users'=>$users);

        $this->load->view('cont/contractAdmin.html',$data);
    }

    //合同详情
    function contract_info(){
        $id = intval($this->uri->segment('3'));
        if($id == '0'){
            $this->load->view('404.html');
        }else{
            //根据id查询合同详情
            $data['cont'] = $this->public_model->select_info($this->contract,'contract_id',$id);

            $this->load->view('cont/conDetaile.html',$data);
        }
    }

    //下发项目
    function lssued_project(){
        $id = intval($this->uri->segment('3'));
        if($id == '0'){
            $this->load->view('404.html');
        }else{
           
            $data['contract'] = $this->public_model->select_where($this->contract,'del_state','0','');
            $data['cont'] = $this->public_model->select_info($this->contract,'contract_id',$id);
              //获取行业类别
            $data['industry'] = $this->public_model->select_where($this->category,'type','1','');
            $data['service'] = $this->public_model->select_where($this->category,'type','2','');
            $data['technology']= $this->public_model->select_where($this->category,'type','3','');
             //酷虎联系人
            $data['lian'] = $this->public_model->select_where($this->customer_con,'company_id',$data['cont']['customer_id'],'');
            //获取用户
            $data['users'] = $this->public_model->select_where_no($this->member,'1','');
            $this->load->view('cont/lssudeProject.html',$data);

        }
    }
    //新增项目
    function add_project(){
        if($_POST){
            $data = $this->input->post();
          //  $data['year'] = date('Y');
            //获取合同信息
            $contract = $this->public_model->select_info($this->contract,'contract_id',$data['c_id']);
            $data['c_number'] = $contract['contract_number'];
            $data['year'] = $contract['contract_year'];
            $cont = array('projectNum'=>$contract['projectNum']-1);
            
            if($this->public_model->insert($this->project,$data)){
                //修改合同项目数
                $this->public_model->updata($this->contract,'contract_id',$contract['contract_id'],$cont);
                if($cont['projectNum'] =='0'){
                    $lssued = array('lssued_state'=>'0');
                    $this->public_model->updata($this->contract,'contract_id',$contract['contract_id'],$lssued);
                }
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"新增项目成功,项目名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作成功！');window.location.href='".site_url('/Project/index')."'</script>";

            }else{
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'0',
                    'log_message'=>"新增项目失败,项目名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.location.href='".site_url('/Project/index')."'</script>";
            }


        }else{
            $this->load->view('404.html');
        }
    }



}