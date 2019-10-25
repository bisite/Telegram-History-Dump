# Telegram Dump History

+ Interfaz de línea de comandos para [Telegram](http://telegram.org).
+ Ingesta de datos para el procesamiento con Machine Learning; el poryecto descarga en formato CSV,JSON y JSONL el historial de conversaciones privadas, grupos y canales a los que el usuario está suscrito. 

### Documentación del API y el protocolo

+ La documentación del APi de Telegram está disponible aquí: http://core.telegram.org/api

+ La documentación del protocolo MTproto está disponible aquí: http://core.telegram.org/mtproto
### Requisitos

+ Ubuntu 16.04 (64-bits)
+ Ubuntu 19.04 (64-bits)
+ Debian 10 (64-bits)
---

### Estructura

![N|estructura](https://i.ibb.co/hBJRJRT/Capturasasa.png)

---

### Instalación en Ubuntu

Clona el Repositorio GitHub

    $ git clone https://github.com/bisite/Telegram-History-Dump.git && cd Telegram-History-Dump/telegram
    
Descomprime el zip que contiene el proyecto y elimina el archivo comprimido

    $ unzip Telegram_Machine_Learning.zip && rm Telegram_Machine_Learning.zip && rm Telegram_Machine_Learning_Debian.zip 
    
Ejecutamos el fichero __installation. sh__ con permisos __sudo__ el cual instalará las bibliotecas necesarias para el correcto funcionamiento del proyecto y se encargará de compilarlo automáticamente.

+ Ubuntu 16.04 (64-bits)

    $ sudo sh installation.sh

+ Ubuntu 19.04 (64-bits)

    $ sudo sh installation_19.sh

### Instalación en Debian

Clona el Repositorio GitHub

    $ git clone https://github.com/bisite/Telegram-History-Dump.git && cd Telegram-History-Dump/telegram
    
Descomprime el zip que contiene el proyecto y elimina el archivo comprimido

    $ unzip Telegram_Machine_Learning_Debian.zip && rm Telegram_Machine_Learning_Debian.zip && rm Telegram_Machine_Learning.zip 
    
Ejecutamos el fichero __installation. sh__ con permisos __sudo__ el cual instalará las bibliotecas necesarias para el correcto funcionamiento del proyecto y se encargará de compilarlo automáticamente.

+ Debian 10 (64-bits)

    $ sudo sh installation_Debian.sh
    
---

### Ejecución del proyecto

Ejecutamos el fihero __api. py__ con el que conseguimos controlar las acciones del proyecto mediante los endpoints que crea.

    $ python api.py
    
| Endpoints | Descripción |
| ------ | ------ |
| */start_dump_stop* | **Comprueba** si la ruta de directorios de descarga existe. **Si no existe** crea una nueva ruta de directorios de descarga y lanza el **cliente** Telegram en segundo plano, ejecuta la descarga de historiales de conversaciones y cierra los procesos una vez terminado. **Si existe**, lanza el **cliente** Telegram en segundo plano, ejecuta la descarga de historiales de conversaciones y cierra los procesos una vez terminado.|
| */start* | **Comprueba** si la ruta de directorios de descarga existe. **Si no existe** crea una nueva ruta de directorios de descarga y lanza el **cliente** Telegram. **Si existe**, lanza el **cliente** Telegram.|
| */stop* | **Finaliza el proceso** creado por el **cliente** Telegram|
| */dump* | Lanza **telegram-history-dump.rb**. Descarga el historial de conversaciones existentes de grupos, canales y conversaciones privadas en formato **JSONL**. Lanza **j_to_c.py**, que convierte los archivos descargados a formato **CSV** y **JSON** para poder ser tratados con **Machine Learning**. Previamente se debe haber iniciado el **cliente** Telegram (/start)|
| */new_user* | Lanza el **cliente** Telegram nuevo, permitiendo **añadir por terminal el teléfono** al que se asociará la aplicación. |
| */dialog_list* | **Muestra** por terminal, información acerca de los **dialogos y conversaciones existentes** |
| */channel_list* | **Muestra** por terminal un listado de los **canales a los que estamos suscritos** |
| */contact_list* | **Muestra** por terminal un listado de los **contactos** del usuario|

---

### Configuraciones de volcado de datos

Las configuraciones de las opciones disponibles del volcado de datos se realizan desde el fichero **config.yaml** que se encuentra en la ruta ***/Telegram/Telegram_Machine_Learning/Telegram-history-dump***

```yaml

  ## Backup targets ##
  #
  # Array of strings for each category
  # Strings can be either a (partial) name or a telegram-cli "peer_id" value
  # An empty array means "everything in this category"
  # An array containing only null means "nothing in this category"

  # Array of user dialogs to backup
  backup_users: [

  ]

  # Array of group dialogs to backup
  backup_groups: [

  ]

  # Array of supergroup dialogs to backup
  backup_supergroups: [
    
  ]

  # Array of broadcast channels to backup
  # WARNING: using this can cause a crash when a channel has too many messages
  # to fit in a single chunk (see https://github.com/vysheng/tg/issues/947)
  backup_channels: [

  ]

  # Array of (partial) names / peer IDs *not* to backup even if they match
  # any of the above target selectors
  blacklist: [

  ]

  # By default telegram-cli returns only the first 100 dialogs/channels
  # We increase this to 1000. If you have even more, increase this value
  maximum_dialogs: 1000


  ## Output options ##

  # Formatters export the JSON output to a different format
  # To enable a formatter, uncomment it along with all of its options
  # If no formatters are enabled, only JSON files are produced
  formatters: {
  #  plaintext: {
  #    date_format: '%Y-%m-%d %H:%M:%S'
  #  },
  #  bare: {},
  #  pisg: {},
  #  html: {
  #    paginate: 1500, # messages per page
  #    use_utc_time: false,
  #    timestamps_every: 50, # messages
  #    loop_video: true, # loop and autoplay videos
  #  },
  }

  # Target directory for the backup files
  # If this is a relative path it will be relative to the script's directory
  # Absolute path starts with '/' or '~'
  backup_dir: '~/Telegram-History-Dump/telegram/output'

  # Data file naming style:
  # True for "My_Chat_Name.jsonl", false for "193044.jsonl" (fixed id)
  friendly_data_filenames: true

  # True to rename data files when their name changes
  # For example, "My_Chat_Name.jsonl" is renamed to "WhoChangedTheTitle.jsonl"
  update_data_filenames: true

  # Maximum number of messages to backup for each target (0 means unlimited)
  backlog_limit: 0

  # At the time of writing, telegram-cli does not properly detect audio/video
  # These will be recognized as documents instead
  # Stickers are also considered documents
  download_media: {
    photo: true,
    document: true,
    audio: true,
    video: true,
  }

  # False to reference downloaded files in the telegram-cli cache
  # True to copy downloaded media to a dedicated directory per dialog
  copy_media: true

  # True to delete media files from telegram-cli cache right after downloading
  # Effectively turns copy_media into move_media
  # Beware: this will cause media files to be redownloaded every backup run
  delete_media: false

  # When a user's real name is formatted, include their last name if possible
  display_last_name: true


  ## Technical options ##

  # Use a unix socket to communicate with telegram-cli
  # Should match the path passed to telegram-cli with the -S option
  #
  # NB: Setting tg_sock to some not false value will cause the script
  # to ignore the next options about TCP connection

  # tg_sock: "/var/run/telegram.sock"
  tg_sock: null

  # Address of the machine you are running telegram-cli on
  # If this is not localhost telegram-cli must be invoked with --accept-any-tcp
  tg_host: 'localhost'

  # Should match the port passed to telegram-cli with the -P option
  tg_port: 9009

  # Number of messages to request in one chunk
  chunk_size: 100

  # Time in seconds to wait between requesting chunks
  chunk_delay: 1.0

  # Time in seconds to wait before considering a request stuck (0 = infinite)
  chunk_timeout: 10

  # Number of times to retry getting one chunk
  chunk_retry: 3

  # Time in seconds to wait before considering a download stuck (0 = infinite)
  # After this time the script skips to the next message
  media_timeout: 100


  ## Advanced behavior settings ##

  # Enables incremental backups (progress is tracked in <outdir>/progress.json)
  # Setting this to false will force a complete re-run of the backup every time
  track_progress: true

  # Replacement string for the characters in dialog names which are potentially
  # problematic in filenames
  # You can set this to '' if the dialog names are unique enough
  character_substitute: '_'

  # Skip messages if their text matches this Ruby regex
  # Example: '/forbidden|words/i'
  filter_regex: null

```

---

### Comandos soportados por terminal

#### Mensajería

* **msg** \<peer\> texto - envía el mensaje a este usuario.
* **fwd** \<usuario\> \<numero-mensaje\> - reenviar un mensaje al usuario. Puedes ver los número de mensajes iniciando el Cliente con -N.
* **chat_with_peer** \<peer\> - inicia un chat con este usuario. /exit o /quit para salir de este modo.
* **add_contact** \<numero-teléfono\> \<nombre\> \<apellido\> - intenta añadir este contacto a la lista de contactos.
* **rename_contact** \<usuario\> \<nombre\> \<apellido\> - intenta renombrar el contacto. Si tienes otro dispositivo será una pelea.
* **mark_read** \<peer\> - marca todos los mensajes como recibidos de ese usuario.

#### Multimedia

* **send_photo** \<peer\> \<nombre-archivo-foto\> - manda una foto al usuario.
* **send_video** \<peer\> \<nombre-archivo-video\> - envia un video al usuario.
* **send_text** \<peer\> \<nombre-archivo-texto> - envia un archivo de texto como un mensaje en plano.
* **load_photo**/load_video/load_video_thumb \<numero-mensaje\> - carga foto/video indicado del directorio de descarga.
* **view_photo**/view_video/view_video_thumb \<numero-mensaje\> - carga foto/video indicado del directorio de descarga y lo abre con el visor por defecto del sistema.


#### Opciones de chat de grupo

* **chat_info** \<chat\> - imprime información del chat.
* **chat_add_user** \<chat\> \<usuario\> - agrega un usuario al chat.
* **chat_del_user** \<chat\> \<usuario\> - elimina un usuario del chat.
* **rename_chat** \<chat\> \<nuevo-nombre\> - cambia el nombre al chat.

#### Search

* **search** \<peer\> patrón - busca el patrón indicado en los mensajes con ese usuario.
* **global_search** patrón - busca el patrón indicado en todos los mensajes.

#### Chat secreto

* **create_secret_chat** \<user\> - crea un chat secreto con el usuario indicado.
* **visualize_key** \<secret_chat\> - Muestra la clave de cifrado. Debes compararla con la del otro usuario.

#### Estadísticas e información varia.

* **user_info** \<user\> - muestra información sobre el usuario.
* **history** \<peer\> [limit] - muestra el historial (y la marca como leído). Limite por defecto = 40.
* **dialog_list** - muestra información acerca del dialogo
* **contact_list** - muestra información acerca de tu lista de contactos.
* **suggested_contacts** - muestra información sobre sus contactos, tiene un máximo de amigos comunes.
* **stats** - solo para depuración.
* **show_license** - muestra la licencia GPLv2.
* **help** - imprime esta ayuda.


### ISSUES

Cuando se establece un offset superior a 0 en el comando histórico de canales, siempre se devuelve el error de seguimiento:

    {"result": "FAIL", "error_code": 71, "error": "RPC_CALL_FAIL 400: OFFSET_INVALID"}

##### SOLUCIÓN:
Abrir el archivo **queries.c** ubicado en el directorio **tgl**.
encontrar la función **_tgl_do_get_history** y comentar algunas líneas como sigue a continuación

```c
static void _tgl_do_get_history (struct tgl_state *TLS, struct get_history_extra *E, void (*callback)(struct tgl_state *TLS,void *callback_extra, int success, int size, struct tgl_message *list[]), void *callback_extra) {
  clear_packet ();
  //tgl_peer_t *C = tgl_peer_get (TLS, E->id);
  //if (tgl_get_peer_type (E->id) != TGL_PEER_CHANNEL || (C && (C->flags & TGLCHF_MEGAGROUP))) {
    out_int (CODE_messages_get_history);
    out_peer_id (TLS, E->id);
  //} else {    
  //  out_int (CODE_channels_get_important_history);

  //  out_int (CODE_input_channel);
  //  out_int (tgl_get_peer_id (E->id));
  //  out_long (E->id.access_hash);
  // }
  out_int (E->max_id);
  out_int (E->offset);
  out_int (E->limit);
  out_int (0);
  out_int (0);
  tglq_send_query (TLS, TLS->DC_working, packet_ptr - packet_buffer, packet_buffer, &get_history_methods, E, callback, callback_extra);
}
```
Guardar el fichero y recompilar el proyecto de nuevo:

    $ cd ~/Telegram-History-Dump/telegram/Telegram_Machine_Learning
    $ sudo ./configure --disable-openssl --prefix=/usr CFLAGS="$CFLAGS -w"
    $ sudo make

##### ISSUE 2
Cuando se establece conexion **telegram_cli** devuelve el error:

    telegram-cli: tgl/mtproto-utils.c:101: BN2ull: Assertion 0' failed. SIGNAL received

##### SOLUCIÓN:
Abrir el archivo **mtproto-utils.c** ubicado en el directorio **tgl**.
comentar las líneas **101** y **115** como sigue a continuación:

```c
static unsigned long long BN2ull (TGLC_bn *b) {
  if (sizeof (unsigned long) == 8) {
    return TGLC_bn_get_word (b);
  } else if (sizeof (unsigned long long) == 8) {
//    assert (0); // As long as nobody ever uses this code, assume it is broken.
    unsigned long long tmp;
    /* Here be dragons, but it should be okay due to be64toh */
    TGLC_bn_bn2bin (b, (unsigned char *) &tmp);
    return be64toh (tmp);
  } else {
    assert (0);
  }
}

static void ull2BN (TGLC_bn *b, unsigned long long val) {
  if (sizeof (unsigned long) == 8 || val < (1ll << 32)) {
    TGLC_bn_set_word (b, val);
  } else if (sizeof (unsigned long long) == 8) {
//    assert (0); // As long as nobody ever uses this code, assume it is broken.
    htobe64(val);
    /* Here be dragons, but it should be okay due to htobe64 */
    TGLC_bn_bin2bn ((unsigned char *) &val, 8, b);
  } else {
    assert (0);
  }
}
```

Guardar el fichero y recompilar el proyecto de nuevo:

    $ cd ~/Telegram-History-Dump/telegram/Telegram_Machine_Learning
    $ sudo ./configure --disable-openssl --prefix=/usr CFLAGS="$CFLAGS -w"
    $ sudo make
