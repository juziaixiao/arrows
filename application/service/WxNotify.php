<?php
/**
 * Created by Kenneth Luff.
 * Author: Kenneth Luff
 * Email: kennethluff@outlook.com
 */

namespace app\api\service;



use think\Db;
use think\Exception;
use think\Loader;
use think\Log;
use app\lib\exception\SuccessMessage;
use app\api\Model\BUser ;
Loader::import('WxPay.WxPay', EXTEND_PATH, '.Api.php');

//Loader::import('WxPay.WxPay', EXTEND_PATH, '.Data.php');


class WxNotify extends \WxPayNotify
{


    public function NotifyProcess($data, &$msg)
    {

        // if ($data['result_code'] == 'SUCCESS') {
          
        // }
          $openid=$data['openid'];
            $user=BUser::where('openid', '=',$openid)->find();
            $updatepayment=$this->updateUserinfo($openid);
        return true;
    }


    private function updateUserinfo($openid)
    {
       $re=BUser::where('openid', '=',$openid)
            ->update(['pay_time' => time()]);
        if(!$re){
            $ex=new SuccessMessage([
                'msg'=>'更新付款状态失败，请及时联系客服',
                'errorcode'=>'AD50000',
                'code'=>500,
            ]);
            throw $ex;
        }
        return true;   
    }

   
}