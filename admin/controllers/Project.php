<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');

// 项目管理
class Project extends Public_Controller
{


        public $project = "project";
        public $category = "category";
        public $contract = "contract";
        public $customer_con = "customer_contacts";
        public $member = "user_member";

        public $project_task_edition = "project_edition";//任务记录
        public $project_task_group = "project_group";//任务组

        function __construct() {
            parent::__construct();
        }


        function index(){
            //
            $config['per_page'] = 10;

		//获取页码

		    $current_page=intval($this->uri->segment(3));//index.php 后数第4个/
        
            //var_dump($current_page);
    
                //配置
    
            $config['base_url'] = site_url('/Project/index');
    
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
            
            $total = count($this->public_model->select_where($this->project,'del_state','0',''));
                $config['total_rows'] = $total;
        
            $this->load->library('pagination');//加载ci pagination类
            $listpage =  $this->public_model->ret_select_project($current_page,$config['per_page']);
            $this->pagination->initialize($config);
            

             //获取行业类别
             $industry = $this->public_model->select_where($this->category,'type','1','');
             $service = $this->public_model->select_where($this->category,'type','2','');
             $technology = $this->public_model->select_where($this->category,'type','3','');
             //获取客户信息
             $customer = $this->public_model->select_where($this->contract,'del_state','0','');
             //获取用户
            $users = $this->public_model->select_where_no($this->member,'1','');
          
            $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'industry'=>$industry,'service'=>$service,'technology'=>$technology,'customer'=>$customer,'users'=>$users);

            $this->load->view('project/projectAdmin.html',$data);

        }

        //新增项目
        function add_project(){
            if($_POST){
                $data= $this->input->post();
                // $data['year'] = date('Y');

                //获取合同信息
                $contract = $this->public_model->select_info($this->contract,'contract_id',$data['c_id']);
                $data['c_number'] = $contract['contract_number'];
                $data['year'] = $contract['contract_year'];
                if($contract['projectNum'] != '0'){
                
                    $num = $contract['projectNum']-1;
                }
                $project_id = $this->public_model->insert_id($this->project,$data);
                if($project_id){
                    
                    $arr = array('type'=>'1','user_id'=> $data['responsible_user'],'project_id'=>$project_id);
                    $this->public_model->insert('h_project_group',$arr);
                    
                    if($contract['projectNum'] != '0'){
                        $num = $contract['projectNum']-1;
                        $cont = array('projectNum'=>$num);
                        $this->public_model->updata($this->contract,'contract_id',$contract['contract_id'],$cont);
                        if($num == '0'){
                            $lssued = array('lssued_state'=>'0');
                            $this->public_model->updata($this->contract,'contract_id',$contract['contract_id'],$lssued);
                        }
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
                    echo "<script>alert('操作成功！');window.parent.location.reload();</script>";

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
                    echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
                }

            }else{
                $this->load->view('404.html');
            }
        }



        //编辑项目
        function edit_project(){

            if($_POST){
                $data= $this->input->post();
                 //获取合同信息
                $contract = $this->public_model->select_info($this->contract,'contract_id',$data['c_id']);
                $data['c_number'] = $contract['contract_number'];
                //获取已有的成员
                $group = $this->public_model->select_where_many('h_project_group','type','1','project_id',$data['id']);



                if($this->public_model->updata($this->project,'id',$data['id'],$data)){

                    if(!empty($group)){
                        $arr = array('type'=>'1','user_id'=> $data['responsible_user'],'project_id'=>$data['id']);
                        $this->public_model->updata_where('h_project_group','type','1','project_id',$data['id'],$arr);
                    }else{
                        $arr = array('type'=>'1','user_id'=> $data['responsible_user'],'project_id'=>$data['id']);
                        $this->public_model->insert('h_project_group',$arr);
                    }


                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"编辑项目成功,项目名称为".$data['title'],
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
                        'log_message'=>"编辑项目失败,项目名称为".$data['title'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.parent.location.reload();";
                }
            }else{
                //获取项目信息
                $id = intval($this->uri->segment(3));
                //获取项目详情
                $porject = $this->public_model->select_info($this->project,'id',$id);

                //获取行业类别
                $data['industry'] = $this->public_model->select_where($this->category,'type','1','');
                $data['service'] = $this->public_model->select_where($this->category,'type','2','');
                $data['technology'] = $this->public_model->select_where($this->category,'type','3','');
                //获取合同
                $data['customer'] = $this->public_model->select_where($this->contract,'del_state','0','');
                //
                $he = $this->public_model->select_info($this->contract,'contract_id',$porject['c_id']);
                //酷虎联系人
                $data['lian'] = $this->public_model->select_where($this->customer_con,'company_id',$he['customer_id'],'');
                 $data['project'] = $porject;
                $data['users'] = $this->public_model->select_where_no($this->member,'1','');

                
                $this->load->view('project/editProject.html',$data);
            }
        }

        //删除合同
        function del_project(){
            if($_POST){
                $id = $this->input->post('id');
                $data['del_state'] = $this->input->post('de_state');
          
                if($this->public_model->updata($this->project,'id',$id,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"删除项目到回收站成功,项目id为".$id,
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
                        'log_message'=>"删除项目到回收站失败,项目id为".$id,
                    );
                    add_system_log($arr);
                    echo "2";
                }
            }else{
                echo '2';
            }
        }

        //修改项目完成状态
        function editProjectState(){
            $id = intval($this->uri->segment('3'));
            if($id == '0'){
                $this->load->view('404.html');
            }else{
                $data['project_status'] = '1';
                if($this->public_model->updata($this->project,'id',$id,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"修改项目完成状态成功,项目ID为".$id,
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
                        'log_message'=>"修改项目完成状态失败,项目ID为".$id,
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.parent.location.reload();</script>";
                }

            }
        }


        //修改深审核
        function edit_project_state(){
            $id = $this->input->post('id');
            $data = $this->input->post('type');
            if($this->public_model->updata($this->project,'id',$data['id'],$data)){
                $arr = array(
                    'log_url'=>$this->uri->uri_string(),
                    'user_id'=>$_SESSION['users']['user_id'],
                    'username'=>$_SESSION['users']['username'],
                    'log_ip'=>get_client_ip(),
                    'log_status'=>'1',
                    'log_message'=>"删除项目到回收站成功,项目名称为".$data['title'],
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
                    'log_message'=>"删除项目到回收站失败,项目名称为".$data['title'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
            }
        }


        //项目导入
        function import_project(){
            $name = date('Y-m-d');
            $inputFileName = "upload/xls/" .$name .'.xls';
            move_uploaded_file($_FILES["pics"]["tmp_name"],$inputFileName);
            //引入类库
            $this->load->library('excel');
            if(!file_exists($inputFileName)){
    
                    echo "<script>alert('文件导入失败!');window.location.href='".site_url('/Project/index')."'</script>";
    
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
    
                $data['year'] = $PHPExcel->getActiveSheet()->getCell("A".$currentRow)->getValue();//获取c列的值
                //合同号
                $contract_id = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取c列的值
                $data['c_number'] = $contract_id;
                //获取合同id
                $contract = $this->public_model->select_info($this->contract,'contract_number',$contract_id);
                if(empty($contract)){
                    $error[] = $currentRow;
                    continue;  
                }else{
                    $data['c_id'] = $contract['contract_id'];
                }

                $data['province'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();//获取d列的值
    
                $data['city'] = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();//获取d列的值
    
                $data['town'] = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();//获取d列的值
    
                $data['title'] = $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();//获取d列的值
    
                $name = $PHPExcel->getActiveSheet()->getCell("G".$currentRow)->getValue();//获取d列的值

                //获取联系人id
                $user = $this->public_model->select_maywhere_info($this->customer_con,'name',$name,'company_id',$contract['customer_id']);
                if(!empty($user)){
                    $data['contacts'] = $user['id'];
                }else{
                    $error[] = $currentRow;
                    continue;   
                }

                $data['technology_id'] = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();//获取d列的值
               
                $data['industry_id'] = $PHPExcel->getActiveSheet()->getCell("I".$currentRow)->getValue();//获取d列的值
                $data['service_id'] = $PHPExcel->getActiveSheet()->getCell("J".$currentRow)->getValue();//获取d列的值
             
                $data['military'] = $PHPExcel->getActiveSheet()->getCell("K".$currentRow)->getValue();//获取d列的值
                $name = $PHPExcel->getActiveSheet()->getCell("L".$currentRow)->getValue();//获取d列的值
                $user = $this->public_model->select_info($this->member,'username',trim($name));
                $data['responsible_user'] = $user['user_id'];


                $data['cycle'] = $PHPExcel->getActiveSheet()->getCell("M".$currentRow)->getValue();//获取d列的值
                $data['requirement'] = $PHPExcel->getActiveSheet()->getCell("N".$currentRow)->getValue();//获取d列的值
                $data['remarks'] = $PHPExcel->getActiveSheet()->getCell("O".$currentRow)->getValue();//获取d列的值
                $data['project_status'] = $PHPExcel->getActiveSheet()->getCell("P".$currentRow)->getValue();//获取d列的值
              
                if($data['year'] == ''){
    
                        //删除临时文件
                    @unlink($inputFileName);
                    exit;
    
                } 
                $project = $this->public_model->insert_id($this->project,$data);
                //新增项目
                if(!empty($project)){
                    $arr = array('type'=>'1','user_id'=> $data['responsible_user'],'project_id'=>$project);
                    $this->public_model->insert('h_project_group',$arr);

                     $lssued = array('lssued_state'=>'0');
                    $this->public_model->updata($this->contract,'contract_id',$contract['contract_id'],$lssued);
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
                'log_message'=>"导入了项目信息，导入成功".$ret['yes']."条，失败".$ret['error']."条，失败条目：".implode(',',$ret['errorlist']),
            );
            add_system_log($arr);   
            echo $arr['log_message'];
        }

        //搜索项目
        function search_project(){
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

            $list = search_project($sear);
           

            $config['total_rows'] = count($list);

            $config['page_query_string'] = TRUE;//关键配置
            // $config['reuse_query_string'] = FALSE;
            $config['query_string_segment'] = 'size';
            $config['base_url'] = site_url('/Project/search_project?').'sear='.$sear;

            // //分页数据\
            $listpage = search_project_page($sear,$config['per_page'],$current_page);
            $this->load->library('pagination');//加载ci pagination类

            $this->pagination->initialize($config);

            // var_dump($data);
           $industry = $this->public_model->select_where($this->category,'type','1','');
             $service = $this->public_model->select_where($this->category,'type','2','');
             $technology = $this->public_model->select_where($this->category,'type','3','');
             //获取客户信息
             $customer = $this->public_model->select_where($this->contract,'del_state','0','');
            
              //获取用户
            $users = $this->public_model->select_where_no($this->member,'1','');
          
            $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links(),'industry'=>$industry,'service'=>$service,'technology'=>$technology,'customer'=>$customer,'users'=>$users);

            $this->load->view('project/projectAdmin.html',$data);

        }

        //获取联系人接口
        function ret_customer(){
            if($_POST){
                //获取合同id
                $id = $this->input->post('contract_id');
                // var_dump($id);
                //查询合同
                $cont = $this->public_model->select_info($this->contract,'contract_id',$id);
                // var_dump($cont['customer_id']);
                if(!empty($cont)){
                    $list = $this->public_model->select($this->customer_con,'company_id',$cont['customer_id']);
                    if(!empty($list)){
                        echo json_encode($list);
                    }else{
                        echo "2";
                    }
                }else{
                    echo "2";
                }
            }else{
                echo "2";
            }
        }

        //送审版列表
        function song_censorship(){
              $id = intval($this->uri->segment('3'));
              if($id == '0'){
                $this->load->view('404.html');
              }else{
                $lists = $this->public_model->select_where_many_sort($this->project_task_edition,'project_id',$id,'type','1','record_id');

                // var_dump($data);
                $data['edition'] = $lists;             
                $data['id'] = $id;             
                // var_dump($data);
                            $data['type'] = '1';             

                $this->load->view('project/edition.html',$data);
              }
        } 
        function xiu_censorship(){
              $id = intval($this->uri->segment('3'));
              if($id == '0'){
                $this->load->view('404.html');
              }else{
                $lists = $this->public_model->select_where_many_sort($this->project_task_edition,'project_id',$id,'type','2','record_id');

                // var_dump($data);
                $data['edition'] = $lists;             
                $data['id'] = $id;  
                            $data['type'] = '2';             
               
                // var_dump($data);
                $this->load->view('project/edition.html',$data);
              }
        } 
        function zong_censorship(){
              $id = intval($this->uri->segment('3'));
              if($id == '0'){
                $this->load->view('404.html');
              }else{
                $lists = $this->public_model->select_where_many_sort($this->project_task_edition,'project_id',$id,'type','3','record_id');

                // var_dump($data);
                $data['edition'] = $lists;             
                $data['id'] = $id;             
                $data['type'] = '3';             
                // var_dump($data);
                $this->load->view('project/edition.html',$data);
              }
        }


         //  新增任务记录
    function addTaskEdition(){
        $id = intval($this->uri->segment(3));
        $type = intval($this->uri->segment(4));
        if($id == '0' || $type == '0'){
          $this->load->view('404.html');
        }else{
          $data['task_id'] = $id;
          $data['type'] = $type;
          $this->load->view('project/taskStates.html',$data);
        }
    }


    //新增任务记录操作
    function add_task_edition(){
        if($_POST){
            $data = $this->input->post();

            if(!empty($_FILES['file']['name'])){
                $config['upload_path']      = 'upload/file/';
                $config['allowed_types']    = 'gif|jpg|png|jpeg|xls|xlsx|doc|docx';
                $config['max_size']     = 5120;
                $config['file_name'] = date('y-m-d').$data['file_name'];

                $this->load->library('upload', $config);

                // 上传

                if(!$this->upload->do_upload('file')) {

                    echo "<script>alert('文件上传失败！');window.parent.location.reload();</script>";exit;
                }else{
                    $data['file_path'] = 'upload/file/'.$this->upload->data('file_name');
                }
            }


            //新增记录
            if($this->public_model->insert($this->project_task_edition,$data)){
                $arr = array(
                  'log_url'=>$this->uri->uri_string(),
                  'user_id'=>$_SESSION['users']['user_id'],
                  'username'=>$_SESSION['users']['username'],
                  'log_ip'=>get_client_ip(),
                  'log_status'=>'1',
                  'log_message'=>"新增任务记录成功,任务类型为".$data['type'],
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
                  'log_message'=>"新增任务记录失败,任务类型为".$data['type'],
                );
                add_system_log($arr);
                echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
            }
        }
    }
        //修改
        function editTaskEdition(){
            $id = intval($this->uri->segment(3));
            if($id == '0'){
              $this->load->view('404.html');
            }else{  
              $edition = $this->public_model->select_info($this->project_task_edition,'record_id',$id);
              $data['taskEdition'] = $edition;
          //    var_dump($data);
              $this->load->view('project/taskStates.html',$data);
            }
        }
        //修改任务纪录
        function edit_task_edition(){
          if($_POST){
              $data = $this->input->post();
              if(!empty($_FILES['file']['name'])){
                  $config['upload_path']      = 'upload/file/';
                  $config['allowed_types']    = 'gif|jpg|png|jpeg|xls|xlsx|doc|docx';
                  $config['max_size']     = 5120;
                  $config['file_name'] = date('y-m-d').$data['file_name'];
                  $this->load->library('upload', $config);
                  // 上传
                  if(!$this->upload->do_upload('file')) {
                      echo "<script>alert('文件上传失败！');window.parent.location.reload();</script>";exit;
                  }else{
                      $data['file_path'] = 'upload/file/'.$this->upload->data('file_name');
                  }
              }
              if($this->public_model->updata($this->project_task_edition,'record_id',$data['record_id'],$data)){
                    $arr = array(
                      'log_url'=>$this->uri->uri_string(),
                      'user_id'=>$_SESSION['users']['user_id'],
                      'username'=>$_SESSION['users']['username'],
                      'log_ip'=>get_client_ip(),
                      'log_status'=>'1',
                      'log_message'=>"编辑任务记录成功,任务类型为".$data['type'].',任务记录id是：'.$data['record_id'],
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
                      'log_message'=>"编辑任务记录失败,任务类型为".$data['type'].',任务记录id是：'.$data['record_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作成功！');window.parent.location.reload();</script>";
              }
          }else{

            $this->load->view('404.html');
          }

        }

        //删除纪录
        function del_edition(){
            if($_POST){
                $id = $this->input->post('id');
                if($this->public_model->delete($this->project_task_edition,'record_id',$id)){
                      $arr = array(
                      'log_url'=>$this->uri->uri_string(),
                      'user_id'=>$_SESSION['users']['user_id'],
                      'username'=>$_SESSION['users']['username'],
                      'log_ip'=>get_client_ip(),
                      'log_status'=>'1',
                      'log_message'=>"删除任务记录成功,任务记录id是：".$id,
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
                      'log_message'=>"删除任务记录失败,任务记录id是：".$id,
                    );
                    add_system_log($arr);
                    echo "2";
             
                }
            }else{
                echo "2";
            }
        }



    //导入任务记录
    function Import_projectState(){
          if($_POST){
            $type = $this->input->post('type');


            $name = date('Y-m-d');
            $inputFileName = "upload/xls/" .$name .'.xls';
            move_uploaded_file($_FILES["pics"]["tmp_name"],$inputFileName);
            //引入类库
            $this->load->library('excel');
            if(!file_exists($inputFileName)){
    
                    echo "<script>alert('文件导入失败!');window.location.href='".site_url('/Project/index')."'</script>";
    
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
                $contract_number = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取c列的值
                //任务
                $project = $this->public_model->select_info($this->project,'c_number',$contract_number);
                  
                $data['project_id'] = $project['id'];
                $data['type'] = $type;

                //
                $data['situation'] =  $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();
                $song_time =  $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();

                $time = $song_time - 25569; //获得秒数
                $data['deliver_time'] = date('Y-m-d', $time*24*60*60); 


                $data['express_num'] =  $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->getValue();
                $data['express_name'] =  $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();

            
                if($contract_number == NULL){
        
                        //删除临时文件
                    @unlink($inputFileName);
                    break;
    
                } 
              
                //任务
                $id =  $this->public_model->insert($this->project_task_edition,$data);

                if(!empty($id)){
                    $yes[] = $id;
                }else{
                    $error[] = $currentRow;
                }

            }
            $ret = array('yes'=>count($yes),'error'=>count($error),'yeslist'=>$yes,'errorlist'=>$error);
            // 日志
            
            $arr = array(
                'log_url'=>$this->uri->uri_string(),
                'user_id'=>$_SESSION['users']['user_id'],
                'username'=>$_SESSION['users']['username'],
                'log_ip'=>get_client_ip(),
                'log_status'=>'1',
                'log_message'=>"导入了任务状态信息，导入成功".$ret['yes']."条，失败".$ret['error']."条，失败条目：".implode(',',$ret['errorlist']),
            );
            add_system_log($arr);   
            echo $arr['log_message'];
              
          }

    }

        //查看项目详情
        function project_info(){
            $id = intval($this->uri->segment('3'));
            if($id == '0'){
                $this->load->view('404.html');
            }else{

                //获取任务详情
                $data['project'] = $this->public_model->select_info($this->project,'id',$id);
                //获取公司职员
                $data['users']= $this->public_model->select_where_no($this->member,'1','');
                //获取任务人员
                $data['group'] = $this->public_model->select_where_many('h_project_group','project_id',$id,'state','1');
          
                //获取留言
                $data['message'] = $this->public_model->select_where_many_sort('h_project_message','project_id',$id,'to_user_id','0','create_time');
                $data['id'] = $id;

                //查出项目纪录
                $data['edition'] = $this->public_model->select_where_many_sort($this->project_task_edition,'project_id',$id,'type','1','create_time');
           
                $this->load->view('project/project_info.html',$data);
            }
        }

        //新增项目人员
        function add_project_group(){
            if($_POST){
                $data = $this->input->post();
                //
                if($data['type'] != '6'){
                    $user = $this->public_model->select_where_many('h_project_group','type',$data['type'],'project_id',$data['project_id']);
                    //判断是否存在职员
                    if(!empty($user)){
                        foreach ($user as $k => $v) {
                            $state = array('state'=>'0');
                            $this->public_model->updata('h_project_group','id',$v['id'],$state);
                        }
                    }
                }
                if($this->public_model->insert('h_project_group',$data)){
                    $arr = array(
                      'log_url'=>$this->uri->uri_string(),
                      'user_id'=>$_SESSION['users']['user_id'],
                      'username'=>$_SESSION['users']['username'],
                      'log_ip'=>get_client_ip(),
                      'log_status'=>'1',
                      'log_message'=>"新增项目小组成员成功,项目id是：".$data['project_id'],
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
                      'log_message'=>"新增项目小组成员失败,项目id是：".$data['project_id'],
                    );
                    add_system_log($arr);
                    echo "2";
                }
            }else{
                echo "2";
            }
        }

        //删除项目成员
        function del_projectGroup(){
            if($_POST){
                $id = $this->input->post('id');
                $state = array('state'=>'0');
                if($this->public_model->updata('h_project_group','id',$id,$state)){
                    $arr = array(
                      'log_url'=>$this->uri->uri_string(),
                      'user_id'=>$_SESSION['users']['user_id'],
                      'username'=>$_SESSION['users']['username'],
                      'log_ip'=>get_client_ip(),
                      'log_status'=>'1',
                      'log_message'=>"删除项目小组成员成功,纪录id是：".$id,
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
                      'log_message'=>"删除项目小组成员失败,纪录id是：".$id,
                    );
                    add_system_log($arr);
                    echo "1";
                }
            }else{
                echo "2";
            }
        }

    //上传文件资料
        function uploadProjectFile(){
            if($_POST){
                $data = $this->input->post();
                $data['create_time'] = date('Y-m-d H:i:s');

                if(!empty($_FILES['file']['name'])){
                      $config['upload_path']      = 'upload/file/';
                      $config['allowed_types']    = 'gif|jpg|png|jpeg|xls|xlsx|doc|docx|pdf';
                      $config['max_size']     = 5120;
                      $config['file_name'] = date('y-m-d').$data['file_name'];
                      $this->load->library('upload', $config);
                      // 上传
                      if(!$this->upload->do_upload('file')) {
                          echo "<script>alert('文件上传失败！');window.parent.location.reload();</script>";exit;
                      }else{
                          $data['file_path'] = 'upload/file/'.$this->upload->data('file_name');
                      }
                }
                if($this->public_model->insert('h_project_record',$data)){
                    $arr = array(
                      'log_url'=>$this->uri->uri_string(),
                      'user_id'=>$_SESSION['users']['user_id'],
                      'username'=>$_SESSION['users']['username'],
                      'log_ip'=>get_client_ip(),
                      'log_status'=>'1',
                      'log_message'=>"提交任务资料成功,纪录类型是：".$data['type'],
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
                      'log_message'=>"提交任务资料失败,纪录类型是：".$data['type'],
                    );
                    add_system_log($arr);
                    echo '2';
                }

            }else{
                echo "2";
            }
        }
        //修改进度
        function editProjectType(){
            if($_POST){
                $data = $this->input->post();
                $data['updataTime'] = date('Y-m-d');
                //获取已有的类型
                $type = $this->public_model->select_where_many('h_project_type','project_id',$data['project_id'],'type',$data['type']);
                if(!empty($type)){
                    if($this->public_model->updata_where("h_project_type",'type',$data['type'],'project_id',$data['project_id'],$data)){
                        $arr = array(
                          'log_url'=>$this->uri->uri_string(),
                          'user_id'=>$_SESSION['users']['user_id'],
                          'username'=>$_SESSION['users']['username'],
                          'log_ip'=>get_client_ip(),
                          'log_status'=>'1',
                          'log_message'=>"修改任务进度成功,纪录类型是：".$data['type'].',项目id是'.$data['project_id'],
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
                          'log_message'=>"修改任务进度失败,纪录类型是：".$data['type'].',项目id是'.$data['project_id'],
                        );
                        add_system_log($arr);
                        echo "2";
                    }

                }else{
                    if($this->public_model->insert('h_project_type',$data)){
                        echo "1";
                    }else{
                        echo "2";
                    }
                }
            }else{
                echo "2";
            }
        }

        


}