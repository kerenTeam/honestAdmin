<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'controllers/Public_Controller.php');

/* 任务 */
class Task extends Public_Controller
{

    public $project = "project";//项目表
    public $project_task = "project_task";//任务表
    public $project_task_edition = "project_task_edition";//任务记录
    public $project_task_group = "project_task_group";//任务组
    public $member = "user_member";//职员
    public $contract = "contract";//合同

    function __construct() {
        parent::__construct();
        //var_dump($_SESSION);
    }


    //返回所有任务
    function task_list(){
          //
            $config['per_page'] = 10;

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
            
            $total = count($this->public_model->select_task());
            $config['total_rows'] = $total;
        
            $this->load->library('pagination');//加载ci pagination类
            $listpage =  $this->public_model->select_task_page($current_page,$config['per_page']);
            $this->pagination->initialize($config);

           
           
           
            $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());
            // echo "<pre>";
            // var_dump($data);
            $this->load->view('task/taskList.html',$data);
    }


    //新增任务
    function add_task(){
      if($_POST){
        $data = $this->input->post();
        //获取合同号
        $project = $this->public_model->select_info($this->project,'id',$data['project_id']);
        $contract = $this->public_model->select_info($this->contract,'contract_id',$project['c_id']);
        $data['contract_number'] = $contract['contract_number'];
        $data['admin_user'] = $_SESSION['users']['user_id'];
        $id = $this->public_model->insert_id($this->project_task,$data);
        if(!empty($id)){
              //第一编织人
              $task_user = array(
                  'task_id'=>$id,
                  'user_id'=>$data['compiling_personnel'],
                  'type'=>'1',
              );
              $this->public_model->insert($this->project_task_group,$task_user);
              //去现场人员
              $scene = array(
                  'task_id'=>$id,
                  'user_id'=>$data['scene_user'],
                  'type'=>'2',
              );
              $this->public_model->insert($this->project_task_group,$scene);

              $arr = array(
                  'log_url'=>$this->uri->uri_string(),
                  'user_id'=>$_SESSION['users']['user_id'],
                  'username'=>$_SESSION['users']['username'],
                  'log_ip'=>get_client_ip(),
                  'log_status'=>'1',
                  'log_message'=>"新增任务成功,项目id为".$data['project_id'],
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
                  'log_message'=>"新增任务失败,项目id为".$data['project_id'],
              );
              add_system_log($arr);
              echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
          }

      }else{

         $data['project'] = $this->public_model->select_where($this->project,'del_state','0','');
         //获取用户
         $data['users'] = $this->public_model->select_where_no($this->member,'1','');
         $this->load->view('task/newTask.html',$data);
      }
    }


    //编辑任务
    function edit_task(){
       if($_POST){
        $data = $this->input->post();
        //获取合同号
        $project = $this->public_model->select_info($this->project,'id',$data['project_id']);
        $contract = $this->public_model->select_info($this->contract,'contract_id',$project['c_id']);
        $data['contract_number'] = $contract['contract_number'];
        $data['admin_user'] = $_SESSION['users']['user_id'];
        if($this->public_model->updata($this->project_task,'id',$data['id'],$data)){
              $arr = array(
                  'log_url'=>$this->uri->uri_string(),
                  'user_id'=>$_SESSION['users']['user_id'],
                  'username'=>$_SESSION['users']['username'],
                  'log_ip'=>get_client_ip(),
                  'log_status'=>'1',
                  'log_message'=>"编辑任务成功,项目id为".$data['project_id'],
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
                  'log_message'=>"编辑任务失败,项目id为".$data['project_id'],
              );
              add_system_log($arr);
              echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
          }

      }else{
        $id = intval($this->uri->segment('3'));
        //获取任务详情
        $data['task'] = $this->public_model->select_info($this->project_task,'id',$id);

          //获取项目
        $data['project'] = $this->public_model->select_where($this->project,'del_state','0','');
         //获取用户
        $data['users'] = $this->public_model->select_where_no($this->member,'1','');
        $this->load->view('task/updateTask.html',$data);
      }
    }

    //删除任务
    function del_task(){
        if($_POST){
            $id = $this->input->post('id');
            $data['state'] = '0';
            if($this->public_model->updata($this->project_task,'id',$id,$data)){
              $arr = array(
                  'log_url'=>$this->uri->uri_string(),
                  'user_id'=>$_SESSION['users']['user_id'],
                  'username'=>$_SESSION['users']['username'],
                  'log_ip'=>get_client_ip(),
                  'log_status'=>'1',
                  'log_message'=>"删除任务成功,任务id为".$id,
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
                  'log_message'=>"删除任务失败,任务id为".$id,
              );
              add_system_log($arr);
              echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
            }
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
          $this->load->view('task/taskStates.html',$data);
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

    function editTaskEdition(){
        $id = intval($this->uri->segment(3));
        if($id == '0'){
          $this->load->view('404.html');
        }else{  
          $edition = $this->public_model->select_info($this->project_task_edition,'record_id',$id);
          $data['taskEdition'] = $edition;
      //    var_dump($data);
          $this->load->view('task/taskStates.html',$data);
        }
    }

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
  


    // 修改任务为已完成状态
    function edit_task_status(){
        $id = intval($this->uri->segment(3));
        if($id == '0'){
            $this->load->view('404.html');
        }else{
          $data['task_status'] = '1';
          if($this->public_model->updata($this->project_task,'id',$id,$data)){
               $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'0',
                        'log_message'=>"确认任务完成成功,任务id为".$id,
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
                        'log_message'=>"确认任务完成失败,任务id为".$id,
              );
              add_system_log($arr);
              echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
          }
        }
    }


    //导入任务列表
    function import_task(){
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
                $contract_number = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取c列的值
                //项目号
                $project = $this->public_model->select_info($this->project,'c_number',$contract_number);
                $data['project_id'] = $project['id'];

                $data['contract_number'] = $contract_number;

                $data['completion_time'] = $PHPExcel->getActiveSheet()->getCell("C".$currentRow)->getValue();
                $go_scene = $PHPExcel->getActiveSheet()->getCell("D".$currentRow)->getValue();
                if(!empty($go_scene)){
                    $scene = $go_scene - 25569; //获得秒数
                    $data['go_scene'] = date('Y-m-d', $scene*24*60*60); 
                }

                $compiling_personnel = $PHPExcel->getActiveSheet()->getCell("E".$currentRow)->  getValue();
                //获取第一编制人
                $user = $this->public_model->select_info($this->member,'username',trim($compiling_personnel));
                if(!empty($user)){
                   $data['compiling_personnel'] = $user['user_id'];
                }
                $compiling = $PHPExcel->getActiveSheet()->getCell("F".$currentRow)->getValue();
                //报告编制人
                $compiling_user = $this->public_model->select_info($this->member,'username',trim($compiling));
                if(!empty($compiling_user)){
                  $data['compiling']  = $compiling_user['user_id'];
                }
                //署名
                $data['signature'] = $PHPExcel->getActiveSheet()->getCell("G".$currentRow)->getValue();
                //现场人员
                $scene = $PHPExcel->getActiveSheet()->getCell("H".$currentRow)->getValue();
                $scene_user = $this->public_model->select_info($this->member,'username',trim($scene));
                if(!empty($scene_user)){
                $data['scene_user']  = $scene_user['user_id'];
                }
                //项目负责人
                $responsibility = $PHPExcel->getActiveSheet()->getCell("I".$currentRow)-> getValue();
                $responsibility_user = $this->public_model->select_info($this->member,'username',trim($responsibility));
                if(!empty($responsibility_user)){
                $data['responsibility']  = $responsibility_user['user_id'];
                }
                // 项目审核人
                $examine = $PHPExcel->getActiveSheet()->getCell("J".$currentRow)->getValue();
                $examine_user = $this->public_model->select_info($this->member,'username',trim($examine));
                if(!empty($examine_user)){
                $data['examine']  = $examine_user['user_id'];
                }
                //技术负责人
                $technology_personnel = $PHPExcel->getActiveSheet()->getCell("K".$currentRow)->getValue();
                $technology_user = $this->public_model->select_info($this->member,'username',trim($technology_personnel));
                if(!empty($technology_user)){
                  $data['technology_personnel']  = $technology_user['user_id'];
                }
                //完成状态
                $data['task_status'] = $PHPExcel->getActiveSheet()->getCell("L".$currentRow)->getValue();
                //
               $song_time =  $PHPExcel->getActiveSheet()->getCell("M".$currentRow)->getValue();
               $xiu_time =  $PHPExcel->getActiveSheet()->getCell("O".$currentRow)->getValue();
            
               $zui_time =  $PHPExcel->getActiveSheet()->getCell("Q".$currentRow)->getValue();
              

            

                if($contract_number == NULL){
        
                        //删除临时文件
                    @unlink($inputFileName);
                    break;
    
                } 

            
               
                //任务
                $id = $this->public_model->insert_id($this->project_task,$data);
                if(!empty($id)){
                    
                
                    $yes[] = $id;
                }else{
                    $error[] = $currentRow;
                }
            }
            $ret = array('yes'=>count($yes),'error'=>count($error),'yeslist'=>$yes,'errorlist'=>$error);
          //  echo $ret['yes'];
            // //            //日志
            
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


    //收缩
    function search_task(){
            $config['per_page'] = 10;
            //获取页码
            $current_page=intval($this->input->get("size"));//index.php 后数第4个/

            $sear = $this->input->get('sear');
            $state = $this->input->get('task_status');
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

            $list = search_task($sear,$state);
           

            $config['total_rows'] = count($list);

            $config['page_query_string'] = TRUE;//关键配置
            // $config['reuse_query_string'] = FALSE;
            $config['query_string_segment'] = 'size';
            $config['base_url'] = site_url('/Task/search_task?').'sear='.$sear.'&state='.$state;

            // //分页数据\
            $listpage = search_task_page($sear,$state,$config['per_page'],$current_page);
            $this->load->library('pagination');//加载ci pagination类

            $this->pagination->initialize($config);


            // var_dump($data);
            $data = array('lists'=>$listpage,'pages' => $this->pagination->create_links());
           
            // var_dump($data);
            $this->load->view('task/taskList.html',$data);
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
                $contract_number = $PHPExcel->getActiveSheet()->getCell("B".$currentRow)->getValue();//获取c列的值
                //任务
                $project = $this->public_model->select_info($this->project_task,'contract_number',$contract_number);
                  
                $data['task_id'] = $project['id'];
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
          //  echo $ret['yes'];
            // //            //日志
            
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


    //送审版列表
    function song_censorship(){
          $id = intval($this->uri->segment('3'));
          if($id == '0'){
            $this->load->view('404.html');
          }else{
            $lists = $this->public_model->select_where_many_sort($this->project_task_edition,'task_id',$id,'type','1','record_id');

            // var_dump($data);
            $data['edition'] = $lists;             
            $data['id'] = $id;             
            // var_dump($data);
                        $data['type'] = '1';             

            $this->load->view('task/edition.html',$data);
          }
    } 
    function xiu_censorship(){
          $id = intval($this->uri->segment('3'));
          if($id == '0'){
            $this->load->view('404.html');
          }else{
            $lists = $this->public_model->select_where_many_sort($this->project_task_edition,'task_id',$id,'type','2','record_id');

            // var_dump($data);
            $data['edition'] = $lists;             
            $data['id'] = $id;  
                        $data['type'] = '2';             
           
            // var_dump($data);
            $this->load->view('task/edition.html',$data);
          }
    } 
    function zong_censorship(){
          $id = intval($this->uri->segment('3'));
          if($id == '0'){
            $this->load->view('404.html');
          }else{
            $lists = $this->public_model->select_where_many_sort($this->project_task_edition,'task_id',$id,'type','3','record_id');

            // var_dump($data);
            $data['edition'] = $lists;             
            $data['id'] = $id;             
            $data['type'] = '3';             
            // var_dump($data);
            $this->load->view('task/edition.html',$data);
          }
    }



}













?>