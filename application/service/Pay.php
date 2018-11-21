<?php
/**
 * Created by Kenneth Luff.
 * Author: Kenneth Luff
 * Email: kennethluff@outlook.com
 */

namespace app\api\service;



use app\api\Model\BBusiness;

use app\lib\exception\TokenException;
use think\Exception;
use think\Loader;
use think\Log;

//Loader::import('WxPay.WxPay', EXTEND_PATH, '.Data.php');
Loader::import('WxPay.WxPay', EXTEND_PATH, '.Api.php');


class Pay
{

    private $orderID;


    function __construct($orderID)
    {
        if (!$orderID)
        {
            throw new Exception('商务夹id号不允许为NULL');
        }
        $this->orderID = $orderID;
    }

    public function pay()
    {


        $price = $this->getBusiness($this->orderID);

        return $this->makeWxPreOrder($price);
        //        $this->checkProductStock();
    }
    private function getBusiness($id=''){

        $industry=BBusiness::get($id);

        return $industry->price;
    }

    // 构建微信支付订单信息
    private function makeWxPreOrder($totalPrice)
    {
        $openid = Token::getCurrentTokenVar('openid');

        if (!$openid)
        {
            throw new TokenException();
        }
        $wxOrderData = new \WxPayUnifiedOrder();
        $wxOrderData->SetOut_trade_no($this->makeOrderNo());
        $wxOrderData->SetTrade_type('JSAPI');
        $wxOrderData->SetTotal_fee($totalPrice * 100);
        $wxOrderData->SetBody('商务名片');
        $wxOrderData->SetOpenid($openid);
        $wxOrderData->SetNotify_url(config('secure.pay_back_url'));

        return $this->getPaySignature($wxOrderData);
    }

    //向微信请求订单号并生成签名
    private function getPaySignature($wxOrderData)
    {
        $wxOrder = \WxPayApi::unifiedOrder($wxOrderData);
        // 失败时不会返回result_code
        if($wxOrder['return_code'] != 'SUCCESS' || $wxOrder['result_code'] !='SUCCESS'){
            Log::record($wxOrder,'error');
            Log::record('获取预支付订单失败','error');
//            throw new Exception('获取预支付订单失败');
        }

        $signature = $this->sign($wxOrder);
        return $signature;
    }


    // 签名
    private function sign($wxOrder)
    {
        $jsApiPayData = new \WxPayJsApiPay();
        $jsApiPayData->SetAppid(config('wx.app_id'));
        $jsApiPayData->SetTimeStamp((string)time());
        $rand = md5(time() . mt_rand(0, 1000));
        $jsApiPayData->SetNonceStr($rand);
        $jsApiPayData->SetPackage('prepay_id=' . $wxOrder['prepay_id']);
        $jsApiPayData->SetSignType('md5');
        $sign = $jsApiPayData->MakeSign();
        $rawValues = $jsApiPayData->GetValues();
        $rawValues['paySign'] = $sign;
        unset($rawValues['appId']);
        return $rawValues;
    }
    public  function makeOrderNo()
    {
        $orderSn=getRandercode();
        return $orderSn;
    }

}