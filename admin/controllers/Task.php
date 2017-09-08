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

        if($this->public_model->insert($this->project_task,$data)){
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

    //任务送审版记录
    function add_task_edition(){
      if($_POST){
          $data = $this->input->post();
            if($data['type'] == 'insert'){
                unset($data['type']);
                if($this->public_model->insert($this->project_task_edition,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增任务送审版成功,任务id为".$data['task_id'],
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
                        'log_message'=>"新增任务送审版失败,任务id为".$data['task_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
                }
            }else{
                unset($data['type']);
                if($this->public_model->updata($this->project_task_edition,'record_id',$data['record_id'],$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"编辑任务送审版成功,任务id为".$data['task_id'],
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
                        'log_message'=>"编辑任务送审版失败,任务id为".$data['task_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
                }

            }
      }else{
        $id = intval($this->uri->segment('3'));
        var_dump($id);

          $this->load->view('task/taskStates.html');

      }
    }

    //任务修订版新增
    function revise_edition(){
      if($_POST){
          $data = $this->input->post();
            if($data['type'] == 'insert'){
                unset($data['type']);
                if($this->public_model->insert($this->project_task_edition,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增任务修订版成功,任务id为".$data['task_id'],
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
                        'log_message'=>"新增任务修订版失败,任务id为".$data['task_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
                }
            }else{
                unset($data['type']);
                if($this->public_model->updata($this->project_task_edition,'record_id',$data['record_id'],$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"编辑任务修订版成功,任务id为".$data['task_id'],
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
                        'log_message'=>"编辑任务修订版失败,任务id为".$data['task_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
                }

            }
      }else{



          //$this->load->view('project/projectAdmin.html',$data);

      }
    }


    //最终版
    function final_edition(){
       if($_POST){
          $data = $this->input->post();
            if($data['type'] == 'insert'){
                unset($data['type']);
                if($this->public_model->insert($this->project_task_edition,$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"新增任务最终版成功,任务id为".$data['task_id'],
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
                        'log_message'=>"新增任务最终版失败,任务id为".$data['task_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
                }
            }else{
                unset($data['type']);
                if($this->public_model->updata($this->project_task_edition,'record_id',$data['record_id'],$data)){
                    $arr = array(
                        'log_url'=>$this->uri->uri_string(),
                        'user_id'=>$_SESSION['users']['user_id'],
                        'username'=>$_SESSION['users']['username'],
                        'log_ip'=>get_client_ip(),
                        'log_status'=>'1',
                        'log_message'=>"编辑任务最终版成功,任务id为".$data['task_id'],
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
                        'log_message'=>"编辑任务最终版失败,任务id为".$data['task_id'],
                    );
                    add_system_log($arr);
                    echo "<script>alert('操作失败！');window.parent.location.reload();</script>";
                }

            }
      }else{

          //$this->load->view('project/projectAdmin.html',$data);

      }
    }

}













?>