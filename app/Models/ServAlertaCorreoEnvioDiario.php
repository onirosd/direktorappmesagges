<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ServAlertaCorreoEnvioDiario extends Model
{
    protected $table = 'serv_alerta_correo_envio_diarios';
    protected $primaryKey = 'codServAlertaCorreoEnvioDiario';
    public $incrementing = true;
    protected $keyType = 'bigInteger';

    protected $fillable = [
        'codServAlertaProgracionCorreo',
        'desDia',
        'codEstadoEnvio',
        'dayFechaProgramada',
        'horaEnvio',
        'correoPara',
        'correoCopia',
        'dayFechaEnvio',
        'dayFechaCreacion',
        'codUsuarioCreacion',
    ];

    // Relación con ServAlertaProgramacionCorreo
    public function alertaProgramacionCorreo()
    {
        return $this->belongsTo(ServAlertaProgramacionCorreo::class, 'codServAlertaProgracionCorreo', 'codServAlertaProgramacionCorreo');
    }
}
