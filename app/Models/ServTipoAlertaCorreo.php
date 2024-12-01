<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ServTipoAlertaCorreo extends Model
{
    protected $table = 'serv_tipo_alerta_correos';
    protected $primaryKey = 'codServTipoAlertaCorreo';
    public $incrementing = true;
    protected $keyType = 'bigInteger';

    protected $fillable = [
        'desNombre',
        'desAbrev',
        'desDescripcion',
    ];
}
