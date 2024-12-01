<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ServAlertaProgramacionCorreo extends Model
{
    protected $table = 'serv_alerta_programacion_correos';
    protected $primaryKey = 'codServAlertaProgramacionCorreo';
    public $incrementing = true;
    protected $keyType = 'bigInteger';

    protected $fillable = [
        'codProyecto',
        'codElementoControl',
        'codModulo',
        'desColumnaFecha',
        'codServTipoAlertaCorreo',
        'codDia',
        'desDia',
        'numDias',
        'flgInicio',
        'dayFechaInicio',
        'dayFechaFin',
        'horaEnvio',
        'flgUsuario',
        'arrUsuarios',
        'codEstado',
        'codNewReg',
        'dayFechaCreacion',
        'codUsuarioCreacion',
    ];

    // Relación con ServTipoAlertaCorreo
    public function tipoAlertaCorreo()
    {
        return $this->belongsTo(ServTipoAlertaCorreo::class, 'codServTipoAlertaCorreo', 'codServTipoAlertaCorreo');
    }

    // Agrega otras relaciones si los modelos existen
    // public function proyecto()
    // {
    //     return $this->belongsTo(Proyecto::class, 'codProyecto', 'codProyecto');
    // }
}
