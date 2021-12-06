<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Status_order extends Model
{
      protected $table = 'status_order';
      const STT_NEW=1;
      const STT_PACKAGE=2;
      const STT_TRANSPORT=3;
      const STT_FINISH=4;
      const STT_FAIL_TRANSPORT=5;
      const STT_SYSTEM_CANCEL=6;
      const STT_CLIENT_CANCEL=7;
}
