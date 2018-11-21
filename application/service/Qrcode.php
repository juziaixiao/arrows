<?php
/**
 * Created by Kenneth Luff.
 * Author: Kenneth Luff
 * Email: kennethluff@outlook.com
 */

namespace app\api\service;




class Qrcode
{
    private $sendUrl = "https://api.weixin.qq.com/wxa/getwxacode?access_token=%s";

    function __construct()
    {
        $accessToken = new AccessToken();
        $token = $accessToken->get();
        $this->sendUrl = sprintf($this->sendUrl, $token);
    }
 

    public function getQr($uid)
    {

        $param = json_encode(array("path"=>"/pages/gerenmingpian/gerenmingpian?fl_id={$uid}",
            "width"=> 150));
        $result = httpRequest($this->sendUrl,$param,'POST');
        $rander_name=getRandercode();
        $path="/uploads/qrcode/".$rander_name.".png";
        file_put_contents($path, $result);
        $base64_image ="data:image/jpeg;base64,".base64_encode( $result );
        $return_msg=[
            'path'=>$path,
            'qrcode'=>$base64_image
        ];
        return $return_msg;
        //$result = json_decode($result, true);
       //dump($result);

    }

    // public function getUserqrcode($uid)
    // {

    //     $param = json_encode(array("path"=>"/pages/gerenmingpian/gerenmingpian?fl_id={$uid}",
    //         "width"=> 150));
    //     $result = httpRequest($this->sendUrl,$param,'POST');
    //     $rander_name=getRandercode();
    //     $path="uploads/qrcode/".$rander_name.".png";
    //     file_put_contents($path, $result);
    //     $base64_image ="data:image/jpeg;base64,".base64_encode( $result );
    //     $return_msg=[
    //         'path'=>$path,
    //         'qrcode'=>$base64_image
    //     ];
    //     return $return_msg;
    //     //$result = json_decode($result, true);
    // }



    

}